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
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use stdClass;

class AdminController extends Controller
{
    private function questionGenerator($questions)
    {
        $totalQuestions = 35;
        $selectedQuestions = [];

        for ($i = count($questions) - 1; $i >= 0 && count($selectedQuestions) < $totalQuestions; $i--) {
            $randomIndex = rand(0, $i);
            $temp = $questions[$i];
            $questions[$i] = $questions[$randomIndex];
            $questions[$randomIndex] = $temp;
            $selectedQuestions[] = $questions[$i];
        }
        return $selectedQuestions;
    }

    private function pCSet($tSPC)
    {
        $categories = [];
        foreach ($tSPC as $key => $value) {
            $categories[] = $value->TestSeriesCategories;
            $set = [];
            foreach ($value->tsPCSet as $key2 => $value2) {
                $set[] = $value2;
                $topics = [];
                $questions = [];
                foreach ($value2->getTsTopic as $key3 => $value3) {
                    $topics[] = $value3->tsTopic;

                }

                foreach ($value2->getSetQuestion as $key3 => $value3) {
                    $questions[] = $value3->getQuestions;

                }

                $set[$key2]->topics = $topics;
                // $set[$key2]->questions = $questions;
                unset($value2->getTsTopic);
                unset($value2->getSetQuestion);
            }
            $categories[$key]->sets = $set;
        }
        return $categories;
    }


    public function addProduct(Request $request)
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
                ], 403);
            }

        }


        if (!$request->release_date) {
            $data['release_date'] = date('Y-m-d');
        }
        // return $data;
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
            'message' => 'Added Successfully'
        ], 200);
    }

    public function updateProduct(Request $request, $p_id)
    {
        $data = $request->input();
        if ($request->hasFile('p_image')) {
            $file = $request->file('p_image');

            // Validate the uploaded file
            if ($file->isValid()) {
                $filename = "product-" . $filename = time() . '.' . $file->getClientOriginalExtension();

                $file->move(public_path('/images'), $filename);

                $data['p_image'] = "/images/" . $filename;
            } else {
                return response()->json(['error' => 'File upload failed'], 400);
            }
        }
        TestSeriesProduct::where('id', $p_id)->update($data);
        $tsp = TestSeriesProduct::where('id', $p_id)->first();
        return response()->json([
            'product_detail' => $tsp,
            'message' => 'Product Updated Successfully',
        ], 200);
    }

    public function addTSProductTopic(Request $request)
    {
        // return $request->input();
        $q_data = [];
        foreach ($request->data as $item) {
            // $q_data = new stdClass();
            $questions = Question::whereIn('tst_id', $item['tst_id'])
                ->get();


            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('testSeriesCategories')
                ->with('testSeriesProduct.getTestSeries')
                ->first();

            // return  $categories;
            $selectedQuestions = $this->questionGenerator($questions);

            $q_data[] = [
                $tspc->testSeriesCategories->tsc_type => $selectedQuestions
            ];
            $sets = TSPCSet::where('id', $item['tspc_id'])->get()->last();
            $setCount = $sets ? $sets->set_number + 1 : 1;
            // return $q_data;
            $tsps = TSPCSet::query()
                ->create([
                    'tspc_id' => $tspc->id,
                    'set_number' => $setCount,
                    'set_name' => $tspc->testSeriesProduct->getTestSeries->test_type . " " . $tspc->testSeriesCategories->tsc_type . ' set - ' . $setCount
                ]);

            $tsps->tsPCTopic()->sync($item['tst_id']);

            foreach ($selectedQuestions as $value) {
                SetQuestion::query()
                    ->create([
                        'q_id' => $value->id,
                        'set_id' => $tsps->id
                    ]);
            }

            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('testSeriesCategories')
                ->with('testSeriesProduct.getTestSeries')
                ->first();

            $temp = $this->pCSet([$tspc]);
            $categories[] = $temp[0];

            TSProductCategory::query()
                ->where('id', $tspc->id)
                ->update([
                    'total_set' => $request->total_set
                ]);
        }


        // $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Successfully TSProductTopic added',
            'categories_data' => $categories
        ], 200);
    }

    public function addTSTopic(Request $request)
    {

        $data = $request->except(['question']);
        // return $data;
        if ($data) {
            $tst = TestSeriesTopics::query()
                ->create(
                    $data
                );
        }


        $questions = $request->question;

        if ($request->tsc_id == 3 || $request->tsc_id == 1) {
            foreach ($questions as $key => $item) {
                $item = array_change_key_case($item, CASE_UPPER);
                $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));
                Question::query()
                    ->create([
                        'question' => $item['QUESTION'],
                        'option_1' => $item['OPTIONS']['a'],
                        'option_2' => $item['OPTIONS']['b'],
                        'option_3' => $item['OPTIONS']['c'],
                        'option_4' => $item['OPTIONS']['d'],
                        'correct_option' => $ans,
                        'explanation' => $item['EXPLANATION'],
                        'tst_id' => $tst->id,
                    ]);
            }
        } elseif ($request->tsc_id == 2) {
            foreach ($questions as $key => $item) {
                $ans = preg_replace('/\s+/', ' ', trim($item['Answer']));
                Question::query()
                    ->create([
                        'question' => $item['Question'],
                        'option_1' => $item['Option_A'],
                        'option_2' => $item['Option_B'],
                        'option_3' => $item['Option_C'],
                        'option_4' => $item['Option_D'],
                        'correct_option' => $ans,
                        'explanation' => $item['Explanation'],
                        'tst_id' => $tst->id,
                    ]);


            }
        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }

    public function updateTSTopic(Request $request, $tst_id)
    {

        $tst = TestSeriesTopics::where('id', $tst_id)->first();

        $questions = $request->question;

        $data = $request->except(['question']);
        if (count($data) != 0) {
            TestSeriesTopics::where('id', $tst_id)->update($data);
        }

        if ($questions) {
            Question::where('tst_id', $tst_id)
                ->delete();
            if ($tst->tsc_id == 3 || $tst->tsc_id == 1) {
                foreach ($questions as $key => $item) {
                    $ans = preg_replace('/\s+/', ' ', trim($item['Answer']));
                    Question::query()
                        ->create([
                            'question' => $item['Question'],
                            'option_1' => $item['Options']['a'],
                            'option_2' => $item['Options']['b'],
                            'option_3' => $item['Options']['c'],
                            'option_4' => $item['Options']['d'],
                            'correct_option' => $ans,
                            'explanation' => $item['Explanation'],
                            'tst_id' => $tst_id,
                        ]);
                }
            } elseif ($tst->tsc_id == 2) {
                foreach ($questions as $key => $item) {
                    $ans = preg_replace('/\s+/', ' ', trim($item['Answer']));
                    Question::query()
                        ->create([
                            'question' => $item['Question'],
                            'option_1' => $item['Option_A'],
                            'option_2' => $item['Option_B'],
                            'option_3' => $item['Option_C'],
                            'option_4' => $item['Option_D'],
                            'correct_option' => $ans,
                            'explanation' => $item['Explanation'],
                            'tst_id' => $tst_id,
                        ]);
                }

            }
        }
        return response()->json([
            'message' => 'Successfully Topic Updated'
        ], 200);
    }

    public function showProductDetails($p_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('id', $p_id)
            ->with('getTsProductCategory.testSeriesCategories')
            ->with('getTsProductCategory.tsPCSet.getTsTopic.tsTopic')
            ->with('getTsProductCategory.tsPCSet')
            ->first();
        // $categories = [];
        // $set = [];
        // return $tst;

        // $categories = [];
        // foreach ($tst->getTsProductCategory as $key => $value) {
        //     $categories[] = $value->TestSeriesCategories;
        //     $set = [];
        //     foreach ($value->tsPCSet as $key2 => $value2) {
        //         $set[] = $value2;
        //         $topics = [];
        //         $questions = [];
        //         foreach ($value2->getTsTopic as $key3 => $value3) {
        //             $topics[] = $value3->tsTopic;

        //         }
        //         foreach ($value2->getSetQuestion as $key3 => $value3) {
        //             $questions[] = $value3->getQuestions;

        //         }

        //         $set[$key2]->topics = $topics;
        //         $set[$key2]->questions = $questions;
        //         unset($value2->getTsTopic);
        //         unset($value2->getSetQuestion);
        //     }
        //     $categories[$key]->sets = $set;
        // }
        // $tst->categories = $categories;
        // return($tst->getTsProductCategory);
        $tst->categories = $this->pCSet($tst->getTsProductCategory);
        unset($tst->getTsProductCategory);


        return response()->json([
            'product_detail' => $tst
        ], 200);
    }

    public function getSetQuestion($set_id)
    {
        $set = TSPCSet::where('id', $set_id)
            ->with('getSetQuestion.getQuestions')
            ->first();
        $questions = [];
        foreach ($set->getSetQuestion as $value) {
            $questions[] = $value->getQuestions;
        }
        unset($set->getSetQuestion);
        $set->questions = $questions;
        return response()->json([
            'set_questions' => $set
        ], 200);

    }

    public function totalUser()
    {
        $users = User::count();
        return response()->json([
            '$user' => $users
        ], 200);
    }

    public function showTopics($tsc_id, $ts_id)
    {
        $topics = TestSeriesTopics::where('tsc_id', $tsc_id)
            ->where('ts_id', $ts_id)
            ->get();
        return response()->json([
            'topics' => $topics
        ], 200);
    }
    public function showSetTopics(Request $request)
    {
        // return $request->input();
        $tspc = TestSeriesProduct::query()
            ->where('id', $request->p_id)
            ->with('getTsProductCategory', function ($query) use ($request) {
                $query->where('tsc_id', $request->tsc_id);
            })
            ->first();
        $topics = TestSeriesCategories::query()
            ->where('id', $request->tsc_id)
            ->with('topics')
            ->first();

        if (count($topics->topics) == 0 && $tspc) {
            return response()->json([
                'message' => "Topics does not exist in " . $topics->tsc_type . " or product doest not exist",
            ], 403);
        }

        return response()->json([
            'set_data' => [$topics],
            'tspc' => [
                $topics->tsc_type => $tspc->getTsProductCategory[0]->id
            ]

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
        $current_date = date('Y-m-d');
        $product = TestSeriesProduct::where('id', $p_id)
            ->where('release_date', "<=", $current_date)
            ->first();

        if ($product) {
            return response()->json([
                'Message' => 'Product Already Released (Product)',
            ], 403);
        }
        $product = TestSeriesProduct::where('id', $p_id)
            ->first();
        // File::delete($product->p_image);
        if (File::exists(public_path($product->p_image))) {
            File::delete(public_path($product->p_image));
        }
        TestSeriesProduct::where('id', $p_id)
            ->delete();

        return response()->json([
            'Message' => 'Successfully Deleted Product',
        ], 200);
    }

    public function deleteSet($set_id)
    {
        $current_date = date('Y-m-d');

        // Check if the set has a release date before the current date
        $set = TSPCSet::where('id', $set_id)
            ->whereHas('getTsPC.testSeriesProduct', function ($query) use ($current_date) {
                $query->where('release_date', '<=', $current_date);
            })
            ->first();

        if ($set) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        // Get the tspc_id for the set
        $tspc_id = TSPCSet::where('id', $set_id)
            ->first('tspc_id');

        // Delete the set
        TSPCSet::where('id', $set_id)->delete();

        // Retrieve tspc with related data
        $tspc = TSProductCategory::query()
            ->where('id', $tspc_id->tspc_id)
            ->with('testSeriesCategories', 'tsPCSet', 'testSeriesProduct.getTestSeries')
            ->first();

        // Update set_number and set_name for tspc sets
        foreach ($tspc->tsPCSet as $key => $value) {
            TSPCSet::where('id', $value->id)
                ->update([
                    'set_number' => $key + 1,
                    'set_name' => $tspc->testSeriesProduct->getTestSeries->test_type . " " . $tspc->testSeriesCategories->tsc_type . ' set - ' . ($key + 1)
                ]);
        }

        // Get tspc with updated data
        $tspc = TSProductCategory::query()
            ->where('id', $tspc_id->tspc_id)
            ->with('testSeriesCategories', 'testSeriesProduct.getTestSeries')
            ->first();

        // Prepare category data
        $categories = $this->pCSet([$tspc]);

        // Return the response
        return response()->json([
            'Message' => 'Successfully Deleted Set',
            'category_data' => $categories[0]
        ], 200);

    }
    public function setCheck($set_id)
    {
        $current_date = date('Y-m-d');
        $set = TSPCSet::where('id', $set_id)
            ->whereHas('getTsPC.testSeriesProduct', function ($query) use ($current_date) {
                $query->where('release_date', "<=", $current_date);
            })
            ->first();

        // return $set;

        if ($set) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        return response()->json([
            'Message' => 'Product is not Released (Set)',
        ], 200);
    }
    public function deleteTopic($tst_id)
    {
        $current_date = date('Y-m-d');
        $topic = TestSeriesProduct::
            where('release_date', "<=", $current_date)
            ->whereHas('getTsProductCategory.tsPCSet.getTsTopic', function ($query) use ($tst_id) {
                $query->where('tst_id', $tst_id);
            })
            ->first();

        // return $topic;
        if ($topic) {
            return response()->json([
                'Message' => 'Already Product Released (topic)',
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
        $current_date = date('Y-m-d');
        $topic = TestSeriesProduct::
            where('release_date', "<=", $current_date)
            ->whereHas('getTsProductCategory.tsPCSet.getTsTopic', function ($query) use ($tst_id) {
                $query->where('tst_id', $tst_id);
            })
            ->first();

        if ($topic) {
            return response()->json([
                'Message' => 'Already Product Released (topic)',

            ], 403);
        }

        $topic_data = TestSeriesTopics::where('id', $tst_id)->first();
        return response()->json([
            'Message' => 'Product is not Released (topic)',
            'topic_data' => $topic_data
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
