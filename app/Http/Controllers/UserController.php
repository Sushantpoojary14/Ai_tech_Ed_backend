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
        $userTestStatuses = UserTestStatus::where('uts_id', $id)->with('questions.questionImage')->get();

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
            ->with('questions.questionImage')
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

        $time_taken = round(((int) $ps->tsproduct->duration - (int) $request->current_timer));

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

        // return $total_answered;
        $total = 0;
        // $to = [];

        foreach ($total_answered as $item) {
            // $total[] = $item->test_answer;
            if ($item->test_answer == $item->questions->correct_option) {
                UserTestStatus::query()
                    ->where('uts_id', $id)
                    ->where('q_id', $item->questions->id)
                    ->update(['marks'=>1]);
                $total++;

            }
        }

        UserTestSeries::query()
            ->where('id', $id)
            ->update(['total_marks' => $total]);
        // return $total;
        // return $total;
        return response()->json([
            'total_answered' => count($total_answered),
            'total_questions' => $ps->tsProduct->total_question,
            'total_marks' => $ps->tsProduct->total_question,
            'total_time' => $ps->tsProduct->duration,
            'time_taken' => (int) $uts->time_taken,
            'right_answer' => $total,
            'wrong_answer' => $ps->tsProduct->total_question - $total,
            'marks_obtained' => $total
        ], 200);

    }

}
