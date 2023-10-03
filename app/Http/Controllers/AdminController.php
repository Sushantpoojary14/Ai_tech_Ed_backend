<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ExtraQuestionField;
use App\Models\Images;
use App\Models\ImagesNames;
use App\Models\QuestionImage;
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
use Illuminate\Support\Facades\Storage;
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
                    $questions[$key3]->images = $value3->getQuestions->questionImage;
                    if ($value3->getQuestions->extraFields) {
                        $questions[$key3]->conversation = $value3->getQuestions->extraFields->conversation;
                        $questions[$key3]->paragraph = $value3->getQuestions->extraFields->paragraph;
                    }
                    unset($value3->getQuestions->questionImage, $value3->getQuestions->extraFields);
                }

                $set[$key2]->topics = $topics;
                $set[$key2]->questions = $questions;
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

            $cate = TestSeriesCategories::whereHas('topics', function ($query) use ($item) {
                $query->where('id', $item['tst_id']);
            })
                ->first();
            // return  $cate;
            if ($cate->id == 2) {
                $selectedQuestions = $questions;
            } else {

                $selectedQuestions = $this->questionGenerator($questions);
            }

            $q_data[] = [
                $tspc->testSeriesCategories->tsc_type => $selectedQuestions
            ];
            $sets = TSPCSet::where('tspc_id', $item['tspc_id'])->get();
            $setCount = count($sets) + 1;
            // return $sets ;
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
    public function updateTSProductTopic(Request $request)
    {
        $item = $request->data;

        $current_date = date('Y-m-d');
        $set = TSPCSet::where('id', $item['tst_id'])
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


        $questions = Question::whereIn('tst_id', $item['tst_id'])
            ->get();

        $selectedQuestions = $this->questionGenerator($questions);

        // $q_data[] = [
        //     $tspc->testSeriesCategories->tsc_type => $selectedQuestions
        // ];
        $set = TSPCSet::where('id', $item['set_id'])->first();

        // return $item['set_id'] ;

        $set->tsPCTopic()->sync($item['tst_id']);
        SetQuestion::query()->where('set_id', $set->id)->delete();
        foreach ($selectedQuestions as $value) {
            SetQuestion::query()
                // ->where('set_id', $set->id)
                ->create([
                    'set_id' => $set->id,
                    'q_id' => $value->id
                ]);
        }
        $sets = TSPCSet::where('id', $item['set_id'])->with('getTsTopic.tsTopic')->first();


        // $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Successfully TSProductTopic added',
            'set_data' => $sets
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
                $q_data = Question::query()
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
                // RETURN ($item);
                if (array_key_exists("IMAGES", $item)) {
                    foreach ($item['IMAGES'] as $key => $image) {
                        QuestionImage::create([
                            'q_id' => $q_data->id,
                            'image_url' => $image
                        ]);
                    }
                }
                if (array_key_exists("PARAGRAPH", $item) || array_key_exists("CONVERSATION", $item)) {
                    ExtraQuestionField::create([
                        'q_id' => $q_data->id,
                        'paragraph' => $item["PARAGRAPH"],
                        'conversation' => $item["CONVERSATION"]
                    ]);

                }
            }
        } elseif ($request->tsc_id == 2) {
            foreach ($questions as $key => $item) {
                $item = array_change_key_case($item, CASE_UPPER);
                $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));
                $q_data = Question::query()
                    ->create([
                        'question' => $item['QUESTION'],
                        'option_1' => $item['OPTION_A'],
                        'option_2' => $item['OPTION_B'],
                        'option_3' => $item['OPTION_C'],
                        'option_4' => $item['OPTION_D'],
                        'correct_option' => $ans,
                        'explanation' => $item['EXPLANATION'],
                        'tst_id' => $tst->id,
                    ]);
                if (array_key_exists("IMAGES", $item)) {
                    return $item;
                    foreach ($item['IMAGES'] as $key => $image) {
                        QuestionImage::create([
                            'q_id' => $q_data->id,
                            'image_url' => $image
                        ]);
                    }
                }
                if (array_key_exists("PARAGRAPH", $item)) {
                    ExtraQuestionField::create([
                        'q_id' => $q_data->id,
                        'paragraph' => $item["PARAGRAPH"],
                    ]);

                }

            }
        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }
    public function getTopicQuestion($tst_id)
    {
        $question = TestSeriesTopics::where('id', $tst_id)
            ->with('getQuestion')
            ->first();
        $question->getQuestion = $question->getQuestion->map(function ($value) {
            if ($value->extraFields) {

                $value->conversation = $value->extraFields->conversation;
                $value->paragraph = $value->extraFields->paragraph;
            }
            unset($value->extraFields);
            return $value;
        });
        return response()->json([
            'message' => 'Success',
            'topic_questions' => $question
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
                    $q_data = Question::query()
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
                    if (array_key_exists("IMAGES", $item)) {
                        foreach ($item['IMAGES'] as $key => $image) {
                            QuestionImage::create([
                                'q_id' => $q_data->id,
                                'image_url' => $image
                            ]);
                        }
                    }

                }
            } elseif ($tst->tsc_id == 2) {
                foreach ($questions as $key => $item) {
                    $ans = preg_replace('/\s+/', ' ', trim($item['Answer']));
                    $q_data = Question::query()
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
                    if (array_key_exists("IMAGES", $item)) {
                        foreach ($item['IMAGES'] as $key => $image) {
                            QuestionImage::create([
                                'q_id' => $q_data->id,
                                'image_url' => $image
                            ]);
                        }
                    }
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
        // return $tst;
        $tst->categories = $this->pCSet($tst->getTsProductCategory);
        unset($tst->getTsProductCategory);

        $current_date = date('Y-m-d');
        $product = TestSeriesProduct::where('id', $p_id)
            ->where('release_date', "<=", $current_date)
            ->first();
        $tst->release_status = !!$product;

        return response()->json([
            'product_detail' => $tst,

        ], 200);
    }

    public function getSetQuestion($set_id)
    {
        $set = TSPCSet::where('id', $set_id)
            ->with('getSetQuestion.getQuestions')
            ->first();
        // return   $set;
        $set->question = $set->getSetQuestion->map(function ($value) {
            if ($value->getQuestions->extraFields) {
                $value->getQuestions->conversation = $value->getQuestions->extraFields->conversation;
                $value->getQuestions->paragraph = $value->getQuestions->extraFields->paragraph;
            }
            $value->getQuestions->images = $value->getQuestions->questionImage;
            unset($value->getQuestions->extraFields, $value->getQuestions->questionImage);
            return $value->getQuestions;
        });
        unset($set->getSetQuestion);
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
    public function getSetTopic($set_id)
    {
        // return $request->input();

        $topics = TSPCTopics::query()
            ->where('tspcs_id', $set_id)
            ->with('tsTopic')
            ->get();
        $all_topic = [];
        foreach ($topics as $value) {
            $all_topic[] = $value->tsTopic;
        }
        return response()->json([
            'set_data' => $all_topic,

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
        $topic = TestSeriesProduct::where('release_date', "<=", $current_date)
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
        $topic = TestSeriesProduct::where('release_date', "<=", $current_date)
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


    public function imageUpload(Request $request)
    {
        // return  $request->images;
        $values = $request->file('images');
        if (is_array($values) || is_object($values)) {
            foreach ($values as $file) {
                // return $value;
                // $value =$request->images;
                if ($file) {
                    // $file = $value;
                    if ($file->isValid()) {
                        $image_name = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                        $filename = $image_name . '.' . $file->getClientOriginalExtension();
                        $file->move(public_path('/images'), $filename);
                        $filepath = "/images/" . $filename;
                        Images::create([
                            'image_url' => $filepath,
                            'image_name' => $image_name,
                            'tsc_id' => $request->tsc_id

                        ]);
                    } else {
                        return response()->json(['error' => 'File upload failed'], 400);
                    }
                }
            }
            return response()->json([
                'message' => 'SuccessFully',
                // "data"=>$request->images
            ], 200);
        }
        return response()->json([
            'message' => 'not proper',

        ], 403);
    }

    public function getImage($tsc_id)
    {
        $images = Images::where('tsc_id', $tsc_id)->get();

        // foreach ($images as $key => $value) {
        //     $value->image_url = $value->images->image_url;
        //     unset($value->images);
        // }

        return response()->json([
            'images' => $images
        ], 200);
    }

    public function saveImage($image)
    {
        $base64Image = $image;

        // Remove the data URL prefix (e.g., "data:image/png;base64,")
        $base64Image = preg_replace('/^data:image\/(png|jpeg|jpg);base64,/', '', $base64Image);

        // Decode the Base64 string into binary image data
        $imageData = base64_decode($base64Image);

        if ($imageData !== false) {
            // Generate a unique filename for the image (e.g., using timestamp)
            $filename = 'image_' . time() . '.png';

            // Define the directory where you want to save the image
            $uploadPath = public_path('NVImages'); // Change this to your desired directory

            // Save the image to the specified directory
            file_put_contents($uploadPath . '/' . $filename, $imageData);

            // You can also store the filename in your database for future reference
            return 'NVImages'. '/' . $filename;
            return response()->json(['message' => 'Image saved successfully', 'filename' => $filename]);
        } else {
            return response()->json(['error' => 'Invalid image data'], 400);
        }
    }

    public function addNVTSTopic(Request $request)
    {

        $data = $request->except(['question']);
        // return $request->input();
        if ($data) {
            $tst = TestSeriesTopics::query()
                ->create(
                    $data
                );
        }


        $questions = $request->question;

        foreach ($questions as $key => $item) {
            $item = array_change_key_case($item, CASE_UPPER);

            $ans = preg_replace('/\s+/', ' ', trim($item['CORRECT_ANS']));
            // return  $item;
            // return  $this->saveImage($item['QUESTION_IMAGE']);
            $q_data = Question::query()
                ->create([
                    'question' => $item['QUESTION'],
                    'option_1' => (explode(":", $item['OPTIONS']['a'])[0] == "data") ? $this->saveImage($item['OPTIONS']['a']) : $item['OPTIONS']['a'],
                    'option_2' => (explode(":", $item['OPTIONS']['b'])[0] == "data") ? $this->saveImage($item['OPTIONS']['b']) : $item['OPTIONS']['b'],
                    'option_3' => (explode(":", $item['OPTIONS']['c'])[0] == "data") ? $this->saveImage($item['OPTIONS']['c']) : $item['OPTIONS']['c'],
                    'option_4' => (explode(":", $item['OPTIONS']['d'])[0] == "data") ? $this->saveImage($item['OPTIONS']['d']) : $item['OPTIONS']['d'],
                    'correct_option' => $ans,
                    'explanation' => null,
                    'tst_id' => $tst->id,
                    'nvq' => 1
                ]);
            // RETURN ($item);
            if (array_key_exists("QUESTION_IMAGE", $item)) {

                QuestionImage::create([
                    'q_id' => $q_data->id,
                    'image_url' => $this->saveImage($item['QUESTION_IMAGE'])
                ]);

            }

        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }
}
