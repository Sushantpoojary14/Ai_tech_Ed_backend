<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesTopics;
use App\Models\TSPCTopics;
use App\Models\TSProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use stdClass;

class AdminController extends Controller
{
    public function getTestSeries()
    {

        $ts = TestSeries::query()
            ->get();

        $tsc = TestSeriesCategories::query()
            ->get();

        return response()->json([
            'ts' => $ts,
            'tsc' => $tsc,
        ], 200);
    }

    public function getTestSeriesTopics($id)
    {

        $tst = TestSeriesTopics::query()
            ->where('tsc_id', $id)
            ->get();


        return response()->json([
            'tst' => $tst,
        ], 200);
    }
    public function addUpdateProduct(Request $request)
    {

        // $validator = Validator::make($request->all(), [
        //     'p_name' => 'required',
        //     'p_description' => 'required',
        //     'p_price' => 'required',
        //     'p_image' => 'required',
        //     'test_month_limit' => 'required',
        // ]);

        // if ($validator->fails()) {
        //     return response()->json($validator->errors(), 400);
        // }

        $data = $request->except(['id', 'tsc_id']);

        $tsp = TestSeriesProduct::updateOrCreate(['id' => $request->id ? $request->id : null], $data);

        if ($tsp) {

            $category = $request->tsc_id;

            $tsp->tsProductCategory()->sync($category);
            $response = [];

            $product = TSProductCategory::where('tsp_id', $tsp->id)->get();

            $tspc = new stdClass();
            foreach ($product as $item) {
                $name = TestSeriesCategories::query()
                    ->where('id', $item->tsc_id)
                    ->first('tsc_type');

                $tspc->{$name->tsc_type} = $item->id;
            }

            foreach ($category as $item) {
                $response[] = TestSeriesCategories::query()
                    ->where('id', $item)
                    ->with('topics')
                    ->first();
            }

            return response()->json([
                'message' => 'Added Successfully',
                'data' => $response,
                'tspc' => $tspc
            ], 200);

        }

        // $tsc = $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Updated Successfully'
        ], 200);
    }


public function addTSProductTopic(Request $request)
{
    // return $request->total_set;
    foreach($request->data as $item){

       $id = TSProductCategory::query()
        ->where('id', $item['tspc_id'])
        ->first('id');

        $id->tsPCTopics()->sync($item['tst_id']);

        TSPCTopics::query()
        ->where('tspc_id', $item['tspc_id'])
        ->update([
            'set_number'=>$item['set_number']
        ]);

        TSProductCategory::query()
        ->where('id', $id->id)
        ->update([
            'total_set'=>$request->total_set
        ]);
    }


    // $tsc =  $tsp->productTopics()->sync($request->tst_id);

    return response()->json([
        'message'=>'success'
    ], 200);
}
}
