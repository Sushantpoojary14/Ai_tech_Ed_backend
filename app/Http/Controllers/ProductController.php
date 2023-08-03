<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesPurchases;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function getTSPurchases($id = null)
    {
        $tsp = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            // ->when($id, function ($query, $id) {
            //     return $query->where('id', $id);
            // })
            ->with('tsProduct')
            ->get();

        return response()->json([
            'tsp' => $tsp
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
                Cart::query()
                    ->updateOrInsert([
                        'user_id' => $request->u_id,
                        'tsp_id' => $item,
                    ]);
            }

        } else {

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
        // return $request->input();
        $p = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            ->where('tsp_id', $request->p_id)
            ->first();


        Cart::query()
            ->where('user_id', Auth()->id())
            ->where('tsp_id', $request->p_id)
            // ->firstOrFail()
            ->delete();

        // return $p;
        if ($p) {
            return response()->json([
                'message' => 'Already Purchased'
            ], 406);
        }


        $current = Carbon::now();

        $product = TestSeriesProduct::query()
            ->where('id', $request->p_id)
            ->first();

        $current_date = date('Y-m-d');
        $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
        // return $current_date;

        TestSeriesPurchases::query()
            ->updateOrInsert([
                'user_id' => Auth()->id(),
                'tsp_id' => $request->p_id,
                'valid_from' => $current_date,
                'valid_till' => $last_date,
            ]);


        return response()->json([
            'message' => 'Added Successfully'
        ], 200);
    }

}
