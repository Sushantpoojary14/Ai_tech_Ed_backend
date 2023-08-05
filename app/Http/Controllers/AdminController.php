<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
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

        $p = TestSeriesProduct::all()->last();;
        $count = $p->id ? $p->id + 1 : 1;

        $data = $request->except(['id', 'tsc_id']);

        if($request->file('p_image')){
            $file= $request->file('p_image');
            $filename= "product-".$count.".".$file->extension();
            $file->move(public_path('/images'), $filename);
            $data['p_image']= $filename;
            // return $data;
        }

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

        // $id = TSProductCategory::query()
        //     ->where('id', $tspc_id)
        //     ->first('id');

        // $set = [];

        // for ($i = 1; $i <= $request->total_set; $i++) {
        //     $set[] = $i;
        // }

        foreach ($request->data as $item) {

            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->first();
            // return $tspc->id;
            $tsps = TSPCSet::query()
                ->create(['tspc_id' => $tspc->id]);

            $tsps->tsPCTopic()->sync($item['tst_id']);


            TSPCSet::query()
                ->where([
                    ['tspc_id', $item['tspc_id']],
                    ['set_id', null],
                ])
                ->update([
                    'set_id' => $request->total_set
                ]);

            TSProductCategory::query()
                ->where('id', $tspc->id)
                ->update([
                    'total_set' => $request->total_set
                ]);
        }


        // $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Successfully TSProductTopic added'
        ], 200);
    }

    public function addUpdateTSTopic(Request $request)
    {
        TestSeriesTopics::query()
            ->updateOrInsert(['id' => $request->id ? $request->id : null], $request->input());

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }
}
