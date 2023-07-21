<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\TestSeriesProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

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
            return response()->json(['error','not found'], 404);
        }

        return response()->json([
            'message' => 'Successfully item deleted',
            'id'=>$id
        ], 200);
    }

    public function showProduct($id = null)
    {
        $cart = TestSeriesProduct::query()
            ->when($id, function ($query, $id) {
                return $query->where('ts_id', $id);
            })
            ->get(['*']);

        return response()->json([
            'product_data' => $cart,
            'message' => 'Successful'
        ], 200);
    }

}
