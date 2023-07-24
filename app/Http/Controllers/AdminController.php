<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesTopics;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function getTestSeries(){

        $ts = TestSeries::query()
        ->get();

        $tsc = TestSeriesCategories::query()
        ->get();

        return response()->json([
            'ts' => $ts,
            'tsc' => $tsc,
        ], 200);
    }

    public function getTestSeriesTopics($id){

        $tst = TestSeriesTopics::query()
        ->where('tsc_id',$id)
        ->get();


        return response()->json([
            'tst' => $tst,
        ], 200);
    }
    public function addUpdateProduct(Request $request){

        $validator = Validator::make($request->all(), [
            'ts_id' => 'required',
            'tsc_id' => 'required',
            'tst_id' => 'required',
            'p_name'=>'required',
            'p_description'=>'required',
            'p_price'=>'required',
            'p_image'=>'required',
            'test_month_limit'=>'required',
            'total_question'=>'required',
            'duration'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $tsp = TestSeriesProduct::updateOrCreate(['id' => $request->id ? $request->id : null], [
            'ts_id' => $request->ts_id,
            'tsc_id' => $request->tsc_id,
            'p_name' => $request->p_name,
            'p_description' => $request->p_description,
            'p_price' => $request->p_price,
            'p_image' => $request->p_image,
            'test_month_limit' => $request->test_month_limit,
            'total_question' => $request->total_question,
            'duration' => $request->duration,
        ]);

        $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message'=>'success'
        ], 200);
    }


    // public function UpdateTestSeries(Request $request)
    // {


    //     $tsp = TestSeriesProduct::updateOrCreate(['id' => $request->id ? $request->id : null], [
    //         'ts_id' => $request->ts_id,
    //         'tsc_id' => $request->tsc_id,
    //         'p_name' => $request->p_name,
    //         'p_description' => $request->p_description,
    //         'p_price' => $request->p_price,
    //         'p_image' => $request->p_image,
    //         'test_month_limit' => $request->test_month_limit,
    //         'total_question' => $request->total_question,
    //         'duration' => $request->duration,
    //     ]);

    //     $tsc =  $tsp->productTopics()->sync($request->tst_id);

    //     return response()->json([
    //         'message'=>'success'
    //     ], 200);
    // }
}
