<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\UserTestSeries;
use App\Models\UserTestStatus;
use App\Models\VerbalQuestion;
use Illuminate\Http\Request;
use App\Models\TestSeriesProduct;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{



    public function getTSPurchases($id = null)
    {
        $tsp = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            // ->when($id, function ($query, $id) {
            //     return $query->where('id', $id);
            // })
            ->with('tsProduct')
            ->get();

        return response()->json([
            'tsp' => $tsp
        ], 200);
    }

    public function userTestStatus(request $request)
    {
        // return $request->id;
        $id = UserTestSeries::query()
            ->where('tsps_id', $request->id)
            ->where('user_id', Auth()->id())
            ->where('complete_status', 0)
            ->select('id')
            ->first();

        if ($id) {
            return response()->json([
                'user_test' => $id->id
            ], 200);
        }


        $current = Carbon::now();

        $id = UserTestSeries::query()
            ->create(
                [
                    'tsps_id' => $request->id,
                    'user_id' => Auth()->id(),
                    'complete_status' => 0,
                    'start_date' => $current->format('d-m-Y'),
                ]
            );


        return response()->json([
            'user_test' => $id->id
        ], 200);
    }


    public function generateRandomQuestion($id)
    {


            $userTestSeries = UserTestSeries::with('userPurchases')->find($id);

            if (!$userTestSeries || !$userTestSeries->userPurchases) {
                return response()->json(['message' => 'No purchases'], 200);
            }

            $testSeriesProduct = TestSeriesProduct::find($userTestSeries->userPurchases->tsp_id);

            if (!$testSeriesProduct) {
                return response()->json(['message' => 'not found'], 404);
            }

            $timer = $userTestSeries->current_timer ?? $testSeriesProduct->duration;


            $userTestStatuses = UserTestStatus::where('uts_id', $id)->with('questions')->get();

            if (!$userTestStatuses->isEmpty()) {
                return response()->json([
                    'test_data' => $userTestStatuses,
                    'current_qid' => $userTestSeries->q_id,
                    'uts_id' => $userTestSeries->id,
                    'timer' => $timer
                ], 200);
            }


            $testSeriesTopics = TestSeriesTopics::where('tsc_id', $testSeriesProduct->tsc_id)->get();

            $questions = [];


            foreach ($testSeriesTopics as $topic) {
                $temp_questions = VerbalQuestion::where('tst_id', $topic->id)
                    // ->where('ts_id', $testSeriesProduct->ts_id)
                    // ->where('tsc_id', $testSeriesProduct->tsc_id)
                    ->get();
                $questions = array_merge($questions, $temp_questions->toArray());
            }
            // return $testSeriesTopics;
            $temp = [];
            for ($i = 0; $i < 35; $i++) {
                $temp[] = $questions[$i];
            }
            // return $temp;


            foreach ($temp as $question) {
                UserTestStatus::create([
                    'q_id' => $question['id'],
                    'uts_id' => $id,
                    'test_time' => 0
                ]);
            }

            $uts2 = UserTestStatus::where('uts_id', $id)->get();
            UserTestSeries::where('id', $id)->update(['q_id' => $uts2[0]->id]);
            UserTestStatus::where('id', $uts2[0]->id)->update(['status_id' => 2]);


            $userTestSeries = UserTestSeries::with('userPurchases')->find($id);
            $userTestStatuses = UserTestStatus::where('uts_id', $id)->with('questions')->get();

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
            ->with('questions')
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
            ->first();

        $ps = TestSeriesPurchases::query()
            ->whereHas('uTestUser', function ($query) use ($uts) {
                $query->where("tsps_id", $uts->tsps_id);
            })
            ->with('tsProduct')
            ->first();

        // UserTestStatus::query()
        //     ->where('uts_id', $id)
        //     ->update([
        //         'status_id' => 1,

        //     ]);

        $time_taken = round(((float) $ps->tsproduct->duration - (float) $request->current_timer));

        UserTestSeries::query()
            ->where('id', $id)
            ->update([
                'complete_status' => 1,
                'end_date' => $current->format('d-m-Y'),
                'time_taken' => $time_taken,
                'current_timer' => null
            ]);

        $t = UserTestSeries::query()->where('id', $id)->first();
        // return $total;
        return response()->json([
            'message' => 'Successfully Submitted',
            'uts_id' => $t
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
        $ps = TestSeriesPurchases::query()
            ->whereHas('uTestUser', function ($query) use ($uts) {
                $query->where("tsps_id", $uts->tsps_id);
            })
            ->with('tsProduct')
            ->first();

        $total_answered = UserTestStatus::query()
            ->where('uts_id', $id)
            ->whereNot('test_answer', null)
            ->with('questions')
            ->get();

        // return $ps->tsProduct;
        $total = [];
        foreach ($total_answered as $item) {
            if ($item->test_answer == $item->questions->answer) {
                $total[] = $item->test_answer;
            }
        }
        // return $total;
        return response()->json([

            'total_answered' => count($total_answered),
            'total_questions' => $ps->tsProduct->total_question,
            'total_marks' => $ps->tsProduct->total_question,
            'total_time' => $ps->tsProduct->duration,
            'time_taken' => (int) $uts->time_taken,
            'right_answer' => count($total),
            'wrong_answer' => $ps->tsProduct->total_question - count($total),
            'marks_obtained' => count($total)

        ], 200);

    }

}
