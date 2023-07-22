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

class UserController extends Controller
{

    public function getTSPurchases($id = null)
    {

        $tsp = TestSeriesPurchases::query()
            ->where('id', Auth()->id())
            ->when($id, function ($query, $id) {
                return $query->where('id', $id);
            })
            ->with('tsProduct')
            ->get();

        // $tsProductData = [];

        // foreach ($tsp as $item) {
        //     $tsProductData[] = $item->tsProduct;
        // }
        return response()->json([
            'tsp' => $tsp
        ], 200);
    }

    public function userTestStatus(request $request)
    {

        $current = Carbon::now();
        // dd(Auth()->id());

        UserTestSeries::query()
            ->updateOrInsert(
                [
                    'tsps_id' => $request->id,
                    'user_id' => Auth()->id(),
                    'complete_status' => 0,
                ],
                [
                    'tsps_id' => $request->id,
                    'user_id' => Auth()->id(),
                    'complete_status' => $request->complete_status,
                    'start_date' => $current->format('d-m-Y'),
                    'end_date' => $request->complete_status == 0 ? null : $current->format('d-m-Y'),
                    'time_taken' => $request->time_taken
                ]
            );

        $id = UserTestSeries::query()
            ->where('tsps_id', $request->id)
            ->where('complete_status', 0)
            ->select('id')
            ->first();

        if (!$id) {
            return response()->json([
                'message' => 'error'
            ], 404);
        }

        return response()->json([
            'user_test' => $id
        ], 200);
    }


    public function generateRandomQuestion($id)
    {

        $ps_id = UserTestSeries::query()
            ->where('id', $id)
            ->with('userPurchases')
            ->first();

        if (!$ps_id) {
            return response()->json([
                'message' => 'No purchases'
            ], 200);
        }

        $uts = UserTestStatus::query()
        ->where('uts_id', $id)
        ->with('questions')
        ->get();

        $question = collect();
        // dd(!$uts->isEmpty());
        if(!$uts->isEmpty()){

            return response()->json([
                'test_data' => $uts,
                'current_qid'=>$ps_id->q_id

            ], 200);
        }

        $p_id = TestSeriesProduct::query()
            ->where('id', $ps_id->userPurchases->tsp_id)
            ->first();

        $t_id = TestSeriesTopics::query()
            ->where('tsc_id', $p_id->tsc_id)
            ->get();


        if (!$t_id && !$p_id) {
            return response()->json([
                'message' => 'not found'
            ], 404);
        }

        // $t_question = [];


        foreach ($t_id as $item) {
            $temp_question = VerbalQuestion::query()
                ->where('tst_id', $item->id)
                ->where('ts_id', $p_id->ts_id)
                ->where('tsc_id', $p_id->tsc_id)
                ->get();

            $question = $question->merge($temp_question);
        }
        // dd( $question);
        foreach($question as $item){
            UserTestStatus::query()
            ->create([
                'q_id'=>$item->id,
                'uts_id'=>$id,
                'test_time'=> 0
            ]);
        }

        $uts = UserTestStatus::query()
        ->where('uts_id', $id)
        ->with('questions')
        ->get();

        return response()->json([
            'test_data' => $uts,
            'current_qid'=>$ps_id->q_id
        ], 200);
    }

}
