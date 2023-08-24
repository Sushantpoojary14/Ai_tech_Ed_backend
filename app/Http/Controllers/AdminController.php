<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ReadingQuestion;
use App\Models\SetQuestion;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\TSPCTopics;
use App\Models\TSProductCategory;
use App\Models\User;
use App\Models\Question;
use App\Models\UserTestSeries;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use stdClass;

class AdminController extends Controller
{



    public function addUpdateProduct(Request $request)
    {

        $category = $request->tsc_id;
        $data = $request->except(['id', 'tsc_id']);

        foreach ($category as $item) {

            $c = TestSeriesCategories::query()
                ->where('id', $item)
                ->first();

            $topics = TestSeriesTopics::where('ts_id', $data['ts_id'])
                ->where('tsc_id', $item)
                ->where('status', 1)
                ->get();

            if (count($topics) == 0) {
                return response()->json([
                    'message' => 'topics is not available',
                    "tsc_type" => $c->tsc_type,
                    'ts_id' => $data['ts_id']
                ], 400);
            }

        }


        $p = TestSeriesProduct::all()->last();
        // return $request->input('p_image');
        $count = $p ? $p->id + 1 : 1;

        $data['total_question'] = 35;

        // return $data;
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

                return response()->json(['error' => 'File upload failed'], 400);
            }
        }

        $tsp = TestSeriesProduct::updateOrCreate(['id' => $request->id ? $request->id : null], $data);

        if ($tsp) {

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
                // return $item;

                $response[] = TestSeriesCategories::query()
                    ->where('id', $item)
                    ->whereHas('topics', function ($query) use ($data) {
                        $query->where('ts_id', $data['ts_id'])
                            ->where('status', 1);
                    })
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
        $q_data = [];
        foreach ($request->data as $item) {
            // $q_data = new stdClass();
            $questions = Question::whereIn('tst_id', $item['tst_id'])
                ->get();

            $totalQuestions = 10;
            $selectedQuestions = [];

            // Fisher-Yates shuffle algorithm

            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('testSeriesCategories')
                ->with('testSeriesProduct.getTestSeries')
                ->first();


            $totalQuestions = 10;

            for ($i = count($questions) - 1; $i >= 0 && count($selectedQuestions) < $totalQuestions; $i--) {
                $randomIndex = rand(0, $i);
                $temp = $questions[$i];
                $questions[$i] = $questions[$randomIndex];
                $questions[$randomIndex] = $temp;
                $selectedQuestions[] = $questions[$i];
            }

            $q_data[] = [
                $tspc->testSeriesCategories->tsc_type => $selectedQuestions
            ];

            // return $q_data;
            $tsps = TSPCSet::query()
                ->create([
                    'tspc_id' => $tspc->id,
                    'set_number' => $request->total_set,
                    'set_name' => $tspc->testSeriesProduct->getTestSeries->test_type . " " . $tspc->testSeriesCategories->tsc_type . ' set - ' . $request->total_set
                ]);

            $tsps->tsPCTopic()->sync($item['tst_id']);

            foreach ($selectedQuestions as $value) {
                SetQuestion::query()
                    ->create([
                        'q_id' => $value->id,
                        'set_id' => $tsps->id
                    ]);
            }

            //     ->where([
            //         ['tspc_id', $item['tspc_id']],
            //         ['set_number', null],
            //     ])
            //     ->update([
            //         'set_number' => $request->total_set
            //     ]);

            TSProductCategory::query()
                ->where('id', $tspc->id)
                ->update([
                    'total_set' => $request->total_set
                ]);
        }


        // $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Successfully TSProductTopic added',
            'question' => $q_data
        ], 200);
    }

    public function addTSTopic(Request $request)
    {
        // return $request->input();
        $tst = TestSeriesTopics::query()
            ->create(['t_name' => $request->t_name, 'tsc_id' => $request->tsc_id, 'ts_id' => $request->ts_id]);

        $questions = $request->question;

        if ($request->tsc_id == 3) {
            foreach ($questions as $key => $item) {
                Question::query()
                    ->create([
                        'question' => $item['Question'],
                        'option_1' => $item['Options']['a'],
                        'option_2' => $item['Options']['b'],
                        'option_3' => $item['Options']['c'],
                        'option_4' => $item['Options']['d'],
                        'correct_option' => $item['Answer'],
                        'explanation' => $item['Explanation'],
                        'tst_id' => $tst->id,
                    ]);
            }
        } elseif ($request->tsc_id == 2 || $request->tsc_id == 1) {
            foreach ($questions as $key => $item) {
                Question::query()
                    ->create([
                        'question' => $item['Question'],
                        'option_1' => $item['Option_A'],
                        'option_2' => $item['Option_B'],
                        'option_3' => $item['Option_C'],
                        'option_4' => $item['Option_D'],
                        'correct_option' => $item['Answer'],
                        'explanation' =>$item['Explanation'],
                        'tst_id' => $tst->id,
                    ]);
                

            }
        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }




    public function showProductDetails($p_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('id', $p_id)
            ->with('getTsProductCategory.testSeriesCategories')
            ->with('getTsProductCategory.tsPCSet.getTsTopic.tsTopic')
            ->first();
        // $categories = [];
        $categories = [];
        // $set = [];

        foreach ($tst->getTsProductCategory as $key => $value) {

            $categories[] = $value->TestSeriesCategories;
            $set = [];
            foreach ($value->tsPCSet as $key2 => $value2) {
                $set[] = $value2;
                $topics = [];
                foreach ($value2->getTsTopic as $key3 => $value3) {
                    $topics[] = $value3->tsTopic;
                }
                $set[$key2]->topics = $topics;
                unset($value2->getTsTopic);
            }
            $categories[$key]->sets = $set;
            $tst->categories = $categories;
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
        $topics = TestSeriesTopics::where('tsc_id', $tsc_id)
            ->get();
        return response()->json([
            'topics' => $topics
        ], 200);
    }

    public function showTopicsDetails($tst_id)
    {
        $topics = TestSeriesTopics::where('id', $tst_id)
            ->first();
        $questions = Question::where('tst_id', $tst_id)->get();

        return response()->json([
            'topics' => $topics,
            'question' => $questions
        ], 200);
    }
    public function deleteProduct($p_id)
    {
        $product = TestSeriesPurchases::where('tsp_id', $p_id)
            ->get();

        if (count($product) != 0) {
            return response()->json([
                'Message' => 'Already',
            ], 403);
        }
        TestSeriesProduct::where('id', $p_id)
            ->delete();

        return response()->json([
            'Message' => 'Successfully Deleted Product',
        ], 200);
    }

    public function deleteSet($set_id)
    {
        $set = UserTestSeries::where('set_id', $set_id)
            ->get();

        if (count($set) != 0) {
            return response()->json([
                'Message' => 'Already Answered',
            ], 403);
        }

        TSPCSet::where('id', $set_id)
            ->delete();

        return response()->json([
            'Message' => 'Successfully Deleted Set',
        ], 200);
    }
    public function deleteTopic($tst_id)
    {

        $topic = TestSeriesProduct::
            whereHas('getTsProductCategory', function ($query) use ($tst_id) {
                $query->whereHas('tsPCSet', function ($query) use ($tst_id) {
                    $query->whereHas('getTsTopic', function ($query) use ($tst_id) {
                        $query->where('tst_id', $tst_id);
                    });
                });
            })
            ->get();

        if (count($topic) != 0) {
            return response()->json([
                'Message' => 'Already Used Topic',
            ], 403);
        }

        TestSeriesTopics::where('id', $tst_id)
            ->delete();

        return response()->json([
            'Message' => 'Successfully Deleted Topic',
        ], 200);
    }
    public function topicCheck($tst_id)
    {

        $topic = TestSeriesProduct::
            whereHas('getTsProductCategory', function ($query) use ($tst_id) {
                $query->whereHas('tsPCSet', function ($query) use ($tst_id) {
                    $query->whereHas('getTsTopic', function ($query) use ($tst_id) {
                        $query->where('tst_id', $tst_id);
                    });
                });
            })
            ->get();

        if (count($topic) != 0) {
            return response()->json([
                'Message' => 'Already Used Topic',
            ], 403);
        }

        return response()->json([
            'Message' => 'Not Used',
        ], 200);
    }


    public function productStatus($p_id, Request $request)
    {
        TestSeriesProduct::where('id', $p_id)
            ->update(['status' => $request->status]);
        return response()->json([
            'message' => 'Successfully changed product status'
        ], 200);

    }

    public function setStatus($set_id, Request $request)
    {
        TSPCSet::where('id', $set_id)
            ->update(['status' => $request->status]);
        return response()->json([
            'message' => 'Successfully changed set status'
        ], 200);

    }



}
