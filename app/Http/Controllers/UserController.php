<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\SetQuestion;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\UserTestSeries;
use App\Models\UserTestStatus;
use App\Models\Question;
use Illuminate\Http\Request;
use App\Models\TestSeriesProduct;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{

    public function userTestStatus(request $request)
    {
        // return $request->id;

        $uts = UserTestSeries::query()
            ->where('tsps_id', $request->ps_id)
            ->where('set_id', $request->set_id)
            ->where('complete_status', 0)
            ->select('id')
            ->first();

        if ($uts) {
            return response()->json([
                'uts_id' => $uts->id
            ], 200);
        }

        $timer = TSPCSet::query()
            ->where('id', $request->set_id, )
            ->with('getTsPC.testSeriesCategories')
            ->first();
        $current = Carbon::now();

        $uts = UserTestSeries::query()
            ->create(
                [
                    'tsps_id' => $request->ps_id,
                    'set_id' => $request->set_id,
                    'complete_status' => 0,
                    'current_timer' => $timer->getTsPC->testSeriesCategories->duration,
                    'start_date' => $current->format('d-m-Y'),
                ]
            );


        return response()->json([
            'uts_id' => $uts->id
        ], 200);
    }


    public function generateRandomQuestion($id)
    {

        $userTestSeries = UserTestSeries::
            with('userPurchases.tsProduct')
            ->find($id);

        $product = $userTestSeries->userPurchases->tsProduct;

        if (!$userTestSeries || !$userTestSeries->userPurchases) {
            return response()->json(['message' => 'No purchases'], 200);
        }

        $testSeriesProduct = TestSeriesProduct::find($userTestSeries->userPurchases->tsp_id);


        $timer = $userTestSeries->current_timer;


        $userTestStatuses = UserTestStatus::where('uts_id', $id)->with('questions.questionImage')->get();

        if (!$userTestStatuses->isEmpty()) {
            return response()->json([
                'test_data' => $userTestStatuses,
                'current_qid' => $userTestSeries->q_id,
                'uts_id' => $userTestSeries->id,
                'timer' => $timer
            ], 200);
        }


        $uts_data = UserTestSeries::where('id', $id)
            ->with('getTSSet')
            ->first();

        $temp_questions = SetQuestion::where('set_id', $uts_data->set_id)
            ->get();

        // return $temp_questions;

        foreach ($temp_questions as $question) {
            UserTestStatus::create([
                'q_id' => $question->q_id,
                'uts_id' => $id,
                'test_time' => 0
            ]);
        }

        $uts2 = UserTestStatus::where('uts_id', $id)->get();
        UserTestSeries::where('id', $id)->update(['q_id' => $uts2[0]->id]);
        UserTestStatus::where('id', $uts2[0]->id)->update(['status_id' => 2]);


        $userTestSeries = UserTestSeries::with('userPurchases')->find($id);
        $userTestStatuses = UserTestStatus::where('uts_id', $id)->with(['questions.questionImage', 'questions.extraFields'])->get();

        return response()->json([
            'test_data' => $userTestStatuses,
            'current_qid' => $userTestSeries->q_id,
            'uts_id' => $userTestSeries->id,
            'timer' => $timer
        ], 200);


    }


    public function updateTestStatus(Request $request, $id)
    {
        $timer = $request->current_timer;

        $requestDataWithoutTimer = $request->except('current_timer');

        UserTestStatus::query()
            ->where('id', $id)
            ->update(
                $requestDataWithoutTimer
            );

        $uts_id = UserTestStatus::where('id', $id)
            ->with('questions')
            ->first();

        UserTestSeries::query()
            ->where('id', $uts_id->uts_id)
            ->update([
                'q_id' => $id,
                'current_timer' => $timer
            ]);

        $questions = UserTestStatus::query()
            ->where('uts_id', $uts_id->uts_id)
            ->with(['questions.questionImage', 'questions.extraFields'])
            ->get();

        return response()->json([
            'message' => 'Successfully Updated',
            'test_data' => $questions,
            'current_qid' => $uts_id->id
        ], 200);
    }


    public function updateTimer($id, Request $request)
    {
        // $uts_id = UserTestStatus::where('id', $id)
        //     ->first();

        UserTestSeries::query()
            ->where('id', $id)
            ->update([
                'current_timer' => $request->current_timer
            ]);
        return response()->json([
            'message' => 'Successfully Updated',
        ], 200);
    }


    public function submitTest($id, Request $request)
    {
        $current = Carbon::now();
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();

        $duration = $uts->getTSSet->getTsPC->testSeriesCategories->duration;

        $total_answered = UserTestStatus::query()
            ->where('uts_id', $id)
            ->whereNot('test_answer', null)
            ->with('questions')
            ->get();


        $total = 0;


        foreach ($total_answered as $item) {
            // return ([$item->test_answer,$item->questions->correct_option]);
            // $total[] = $item->test_answer;
            if ($item->test_answer == $item->questions->correct_option) {
                UserTestStatus::query()
                    ->where('uts_id', $id)
                    ->where('q_id', $item->questions->id)
                    ->update(['marks' => 1]);
                $total++;

            }
        }
        // return ([$total]);
        $time_taken = round(((int) $duration - (int) $request->current_timer));

        UserTestSeries::query()
            ->where('id', $id)
            ->update([
                'complete_status' => 1,
                'end_date' => $current->format('d-m-Y'),
                'time_taken' => $time_taken,
                'current_timer' => null,
                'total_marks' => $total,
                'percentage' => ($total / 35) * 100,
                'total_answered' => count($total_answered)
            ]);

        $t = UserTestSeries::query()->where('id', $id)->first();
        // return $total;
        return response()->json([
            'message' => 'Successfully Submitted',
            'uts_id' => $id
        ], 200);
    }
    public function getTestResult($id)
    {
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->first();

        if (!$uts) {
            return response()->json([
                'message' => 'does not exist'
            ], 401);
        }
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();

        $duration = $uts->getTSSet->getTsPC->testSeriesCategories->duration;

        $total_answered = UserTestStatus::query()
            ->where('uts_id', $id)
            ->whereNot('test_answer', null)
            ->get();

        // $total = 0;

        // foreach ($total_answered as $item) {
        //     // $total[] = $item->test_answer;
        //     if ($item->test_answer == $item->questions->correct_option) {
        //         UserTestStatus::query()
        //             ->where('uts_id', $id)
        //             ->where('q_id', $item->questions->id)
        //             ->update(['marks' => 1]);
        //         $total++;

        //     }
        // }

        // $uts =UserTestSeries::query()
        //     ->where('id', $id)
        //     ->first();
        // return $total;
        // return $total;
        return response()->json([
            'total_answered' => count($total_answered),
            'total_questions' => 35,
            'total_marks' => 35,
            'total_time' => $duration,
            'time_taken' => (int) $uts->time_taken,
            'right_answer' => $uts->total_marks,
            'wrong_answer' => (int) (35 - $uts->total_marks),
            'marks_obtained' => (int) $uts->total_marks
        ], 200);

    }
    public function UserSetData($user_id)
    {
        $product = TestSeriesPurchases::query()
            ->where('user_id', $user_id)
            ->with('tsProduct.getTsProductCategory.tsPCSet')
            ->get();
        $total_test = 0;
        $complete_test = 0;
        $incomplete_test = 0;
        $Remaining_test = 0;
        foreach ($product as $key => $value) {
            $temp_set = $value->tsProduct->getTsProductCategory;
            foreach ($temp_set as $key => $value2) {
                $total_test += count($value2->tsPCSet);
                // foreach ($value2->tsPCSet as $key => $value3) {
                // $temp_CStatus = array_column($test_data->toArray(), 'complete_status');
                // }
            }
            $test_data = UserTestSeries::
                where('tsps_id', $value->id)
                ->first();
            if ($test_data) {
                $complete_test += $test_data->complete_status == 1;
                $incomplete_test += $test_data->complete_status == 0;
            }
        }
        $Remaining_test += $total_test - ($incomplete_test + $complete_test);

        return response()->json([
            // 'message' => 'Successfully Submitted',
            'total_test' => $total_test,
            'complete_test' => $complete_test,
            'incomplete_test' => $incomplete_test,
            'Remaining_test' => $Remaining_test,
            // $temp_CStatus,
            // $temp,

            // $test_data,
        ], 200);

    }
    public function getRProduct($user_id)
    {
        $product = TestSeriesProduct::query()
            ->whereDoesntHave('tsPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            // ->with('tsPurchases')
            ->get();

        return response()->json([
            // 'message' => 'Successfu',
            'remaining_product' => $product
        ], 200);
    }

    public function getTSPurchasesLimit($user_id)
    {
        $purchases = TestSeriesPurchases::query()
            ->where('user_id', $user_id)
            // ->with('tsProduct')
            ->with([
                'tsProduct' => function ($query) {
                    $query->with(
                        'getTsProductCategory.testSeriesCategories',
                        'getTsProductCategory.tsPCSet'
                    );
                }
            ])
            ->first();
        $new_purchases = [];
        if (!$purchases) {
            return response()->json([
                'tsp' => $new_purchases,
            ], 200);
        }
        // $purchases->test_data = [];
        $temp_data = $purchases->tsProduct->getTsProductCategory;
        $purchases->test_data = array_column($temp_data->toArray(), 'test_series_categories');

        $purchases->category = collect($purchases->test_data)->map(function ($item, $key) use ($temp_data) {
            $item['set'] = $temp_data[$key]->tsPCSet;
            return $item;
        })->all();

        // return $purchases->category;
        if (is_array($purchases->category)) {
            foreach ($purchases->category as $value2) {
                foreach ($value2['set'] as $value3) {
                    $value3->valid_from = $purchases->valid_from;
                    $value3->valid_till = $purchases->valid_till;
                    $value3->tsc_type = $value2['tsc_type'];
                    $value3->duration = $value2['duration'];
                    unset($value3->tspc_id, $value3->set_number, $value3->status);
                    $new_purchases[] = $value3;
                }
            }


        }
        unset($purchases->tsProduct);

        return response()->json([
            'tsp' => $new_purchases,
        ], 200);
    }

    public function get_user_all_result($user_id,$ts_id)
    {
        $user_RA = UserTestSeries::query()
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->whereHas('userPurchases.tsProduct', function ($query) use ($ts_id) {
                $query->where('ts_id', $ts_id);
            })
            ->with('getTSSet')
            ->get();
        //  $user_RA
        $user_RA = $user_RA->map(function ($item) {
            $item->set_name = $item->getTSSet->set_name;
            unset($item->getTSSet);
            return $item;
        });

        return response()->json([
            'all_results' => $user_RA,

        ], 200);
    }
    public function get_user_result_limit($user_id)
    {
        $user_RA = UserTestSeries::query()
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->with('getTSSet')
            ->limit(6)
            // ->select('id')
            ->get();

        $user_RA = $user_RA->map(function ($item) {
            $item->set_name = $item->getTSSet->set_name;
            unset($item->tsps_id, $item->set_id,$item->q_id, $item->total_answered, $item->current_timer, $item->time_taken, $item->end_date, $item->complete_status, $item->getTSSet);
            return $item;
        });


        return response()->json([
            'result' => $user_RA,
        ], 200);
    }
}
