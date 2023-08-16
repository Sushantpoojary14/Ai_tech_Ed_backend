<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ReadingQuestion;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\TSPCTopics;
use App\Models\TSProductCategory;
use App\Models\User;
use App\Models\VerbalQuestion;
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

        $p = TestSeriesProduct::all()->last();
        // return $request->input('p_image');
        $count = $p ? $p->id + 1 : 1;

        $data = $request->except(['id', 'tsc_id']);

        // if ($request->file('p_image')) {
        //     $file = $request->file('p_image');
        //     $filename = "product-" . $count . "." . $file->extension();
        //     $file->move(public_path('/images'), $filename);
        //     $data['p_image'] = "/images/" . $filename;
        //     // return $filename;
        // }

        if ($request->hasFile('p_image')) {
            $file = $request->file('p_image');

            // Validate the uploaded file
            if ($file->isValid()) {
                // Generate a unique filename
                // $imageFiles = glob(public_path('/images/product-*.*'));
                // $count = count($imageFiles) + 1;
                $filename = "product-" . $filename = time() . '.' . $file->getClientOriginalExtension();

                // Move the file to the desired location
                $file->move(public_path('/images'), $filename);

                // Update the data with the stored image path
                $data['p_image'] = "/images/" . $filename;
            } else {
                // Handle file upload error
                return response()->json(['error' => 'File upload failed'], 400);
            }
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

    public function addTSTopic(Request $request)
    {
        // return $request->input();
        $tst = TestSeriesTopics::query()
            ->create(['t_name' => $request->t_name, 'tsc_id' => $request->tsc_id]);

        $questions = $request->question;

        if ($request->tsc_id == 3 || $request->tsc_id == 1) {
            foreach ($questions as $key => $item) {
                VerbalQuestion::query()
                    ->create([
                        'question' => $item['question'],
                        'option_1' => $item['options']['a'],
                        'option_2' => $item['options']['b'],
                        'option_3' => $item['options']['c'],
                        'option_4' => $item['options']['d'],
                        'correct_option' => $item['answer'],
                        'explanation' => $item['explanation'],
                        'tst_id' => $tst->id,
                    ]);
            }
        } elseif ($request->tsc_id == 2) {
            foreach ($questions as $key => $item) {
                ReadingQuestion::query()
                    ->create([
                        'question' => $item['question'],
                        'option_1' => $item['options']['a'],
                        'option_2' => $item['options']['b'],
                        'option_3' => $item['options']['c'],
                        'option_4' => $item['options']['d'],
                        'correct_option' => $item['answer'],
                        'explanation' => $item['explanation'],
                        'tst_id' => $tst->id,
                    ]);
            }
        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }

    public function showProduct($ts_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('ts_id', $ts_id)
            ->with('tsPurchases')
            ->get();

        $tstWithCounts = $tst->map(function ($testSeriesProduct) {
            $testSeriesProduct->purchaseCount = $testSeriesProduct->tsPurchases->count();
            unset($testSeriesProduct->tsPurchases);
            return $testSeriesProduct;
        });

        return response()->json([
            'product' => $tstWithCounts
        ], 200);
    }


    public function showProductDetails($p_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('id', $p_id)
            ->with('getTsProductCategory.testSeriesCategories',)
            ->with('getTsProductCategory.tsPCSet.getTsTopic.tsTopic')
            ->first();
        $categories = [];

        $set = [];
        foreach ($tst->getTsProductCategory as $key => $value) {

            $categories[] = $value->TestSeriesCategories;

            foreach ($value->tsPCSet as $key2 => $value2) {
                $set[] = $value2;
                $topics = [];
                foreach ($value2->getTsTopic as $key3 => $value3) {
                    $topics[] = $value3->tsTopic;
                    $set[$key2]->topics = $topics;
                }
                unset($value2->getTsTopic);
            }
            $categories[$key]->sets = $set;
            $tst->categories =  $categories;
        }

        unset($tst->getTsProductCategory);


        return response()->json([
            'product_detail' => $tst
        ], 200);
    }


    public function totalUser()
    {
        $users = User::count();
        return response()->json([
            '$user' => $users
        ], 200);
    }

    public function showTopics($tsc_id)
    {
        $topics = User::where('tsc_id', $tsc_id)
            ->get();
        return response()->json([
            'topics' => $topics
        ], 200);
    }
}
