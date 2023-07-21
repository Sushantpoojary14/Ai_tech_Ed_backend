<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use PHPOpenSourceSaver\JWTAuth\Exceptions\JWTException;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
class UserAuthController extends Controller
{
    //
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth:admin', ['except' => ['login']]);
        Config::set('auth.defaults.guard', 'users');
    }

    // /**
    //  * Get a JWT via given credentials.
    //  *
    //  * @return \Illuminate\Http\JsonResponse
    //  */
    public function login(Request $request)
    {
        $credentials = request(['email', 'password']);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['status' => 'failed',
            'message' =>  'UnAuthorized'], 404);
        }

        return $this->respondWithToken($token);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:100|unique:users',
            'phone'=>'required|string|max:10|unique:users',
            'password' => 'required|string|min:8',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }


        User::query()->create([
            "name" => ucfirst($request->fname)." ".ucfirst($request->lname),
            "email"=>$request->email,
            "phone"=>$request->phone,
            "password"=>Hash::make($request->password)
    ]);
        $credentials = request(['email', 'password']);
        return $this->respondWithToken(auth()->attempt($credentials));
    }

    public function passwordCheck(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'prev_password' => 'required|string',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        $user_email = auth()->user()->email;
        if (!auth()->attempt(['email'=>$user_email ,'password'=>$request->prev_password])) {
            return response()->json(['status' => 'failed',
            'message' =>  'UnAuthorized'], 404);
        }

        return response()->json(['message' => 'Authorized'],200);
    }


    public function passwordChange(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'new_password' => 'required|string',
        ]);

        $user_email = auth()->user()->email;

        User::query()
        ->where('email',$user_email)
        ->update(array_merge(['password'=>Hash::make($request->new_password)]));

        return response()->json(['message' => 'Successfully Changed'],200);
    }


    public function profileChange(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'email' => 'required|string|email|max:100',
            'name'=>'required|string|',
        ]);

        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }
        $user_email = auth()->user()->email;
        if (!auth()->attempt(['email'=>$user_email ,'password'=>$request->prev_password])) {
            return response()->json(['status' => 'failed',
            'message' =>  'UnAuthorized'], 404);
        }

        User::query()
        ->where('email',$user_email)
        ->update(array_merge(['password'=>Hash::make($request->new_password)]));

        return response()->json(['message' => 'Successfully Changed'],200);
    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function user()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {

        // dd(auth('admin'));
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
        // return Auth::user()->id;
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => [
                'id' => auth()->user()->id,
                'name' => auth()->user()->name,
                'email' => auth()->user()->email,
                'phone' => auth()->user()->phone,
                'DOB' => auth()->user()->DOB,
            ]
        ]);
    }
}
