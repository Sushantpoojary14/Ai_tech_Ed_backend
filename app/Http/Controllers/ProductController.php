<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesPurchases;
use App\Models\TSPCSet;
use App\Models\TSProductCategory;
use App\Models\UserTestSeries;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function getTestSeries()
    {
        $ts = TestSeries::query()
            ->get();

        // $tsc = TestSeriesCategories::query()
        //     ->get();

        return response()->json([
            'ts' => $ts,
            // 'tsc' => $tsc,
        ], 200);
    }
    public function getTSPurchases($ts_id = null)
    {

        $purchases = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            ->whereHas('tsProduct', function ($query) use ($ts_id) {
                $query->where('ts_id', $ts_id);
            })
            ->with('tsProduct')
            ->with([
                'tsProduct' => function ($query) {
                    $query->with(
                        'getTsProductCategory.testSeriesCategories',
                        'getTsProductCategory.tsPCSet'
                    );
                }
            ])
            ->get();


        return response()->json([
            'tsp' => $purchases
        ], 200);
    }
    public function getTSDetails($ps_id)
    {

        $temp = UserTestSeries::query()
            ->where('id', $ps_id)
            ->with('userPurchases.tsProduct')
            ->first();
        $uts_id = $temp->id;
        $purchase = $temp->userPurchases;
        $detail = UserTestSeries::query()
            ->where('id', $ps_id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();
        $test_detail = $detail->getTSSet;
        return response()->json([
            'test_detail' => $test_detail,
            'tsp' => $purchase,
            'uts_id' => $uts_id
        ], 200);
    }
    public function getTSPurchasesId($id = null)
    {
        $tsp = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            ->get();
        $pc = [];
        foreach ($tsp as $key => $value) {
            $pc[] = $value->tsp_id;
        }
        return response()->json([
            'tsp' => $pc
        ], 200);
    }
    public function addCart(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'p_id' => 'required',
            'u_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (is_array($request->p_id)) {



            foreach ($request->p_id as $item) {

                $id = TestSeriesPurchases::query()
                    ->where([
                        'user_id' => $request->u_id,
                        'tsp_id' => $item,
                    ])->first();
                if ($id)
                    continue;

                Cart::query()
                    ->updateOrInsert([
                        'user_id' => $request->u_id,
                        'tsp_id' => $item,
                    ]);
            }

        } else {
            $id = TestSeriesPurchases::query()
                ->where([
                    'user_id' => $request->u_id,
                    'tsp_id' => $request->p_id,
                ])->first();

            if ($id)
                return response()->json([
                    'message' => 'Added successfully'
                ], 200);

            Cart::query()
                ->updateOrInsert([
                    'user_id' => $request->u_id,
                    'tsp_id' => $request->p_id,
                ]);
        }

        return response()->json([
            'message' => 'Added successfully'
        ], 200);

    }

    public function showCart($id)
    {
        $cart = Cart::query()
            ->where('user_id', $id)
            ->select('tsp_id')
            ->with('tsProduct')
            ->get();

        // $product = TestSeriesProduct::query()
        // ->whereIn('id',$cart)
        // ->get();


        return response()->json([
            'cart_data' => $cart,
            'message' => 'Successful'
        ], 200);
    }

    public function removeCart($id)
    {
        $user = Auth::user()->id;
        $cart = Cart::query()
            ->where('tsp_id', $id)
            ->where('user_id', $user)
            ->firstOrFail()
            ->delete();

        if (!$cart) {
            return response()->json(['error', 'not found'], 404);
        }

        return response()->json([
            'message' => 'Successfully item deleted',
            'id' => $id
        ], 200);
    }

    public function showProduct($id = null)
    {
        $products = TestSeriesProduct::query()
            ->where('status', 1)
            ->when($id, function ($query, $id) {
                return $query->where('ts_id', $id);
            })
            ->get(['*']);

        return response()->json([
            'product_data' => $products,
            'message' => 'Successful'
        ], 200);
    }
    public function sProduct($id)
    {
        $product = TestSeriesProduct::query()
            ->where('id', $id)
            ->first();

        return response()->json([
            'product_data' => $product,
            'message' => 'Successful'
        ], 200);
    }
    public function addTSPurchases(request $request)
    {
        // return !!is_array($request->p_id);
        $p = TestSeriesPurchases::query()
            ->when(is_array($request->p_id), function ($query) use ($request) {
                $query->whereIn('tsp_id', $request->p_id);
            })
            ->when(!is_array($request->p_id), function ($query) use ($request) {
                $query->where('tsp_id', $request->p_id);
            })
            ->where('user_id', Auth()->id())
            ->get();


        Cart::query()
            ->where('user_id', Auth()->id())
            ->when(is_array($request->p_id), function ($query) use ($request) {
                $query->whereIn('tsp_id', $request->p_id);
            })
            ->when(!is_array($request->p_id), function ($query) use ($request) {
                $query->where('tsp_id', $request->p_id);
            })
            // ->firstOrFail()
            ->delete();

        // return count($p);
        if (count($p) != 0) {
            return response()->json([
                'message' => 'Already Purchased',
                'purchases' => $p
            ], 406);
        }


        // $current = Carbon::now();
        $current_date = date('Y-m-d');
        // $product = TestSeriesProduct::query()
        //     ->where('id', $request->p_id)
        //     ->first();


        // $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
        // return $current_date;

        if (is_array($request->p_id)) {
            foreach ($request->p_id as $value) {
                $product = TestSeriesProduct::query()
                    ->where('id', $value)
                    ->first();

                $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
                TestSeriesPurchases::query()
                    ->updateOrInsert([
                        'user_id' => Auth()->id(),
                        'tsp_id' => $value,
                        'valid_from' => $current_date,
                        'valid_till' => $last_date,
                    ]);
            }
        } else {
            $product = TestSeriesProduct::query()
                ->where('id', $request->p_id)
                ->first();

            $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
            TestSeriesPurchases::query()
                ->updateOrInsert([
                    'user_id' => Auth()->id(),
                    'tsp_id' => $request->p_id,
                    'valid_from' => $current_date,
                    'valid_till' => $last_date,
                ]);
        }



        return response()->json([
            'message' => 'Added Successfully'
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
