<?php

use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserAuthController;
use App\Http\Controllers\UserController;
// use App\Http\Controllers\ProductController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::post('login',[UserAuthController::class,'login']);
Route::post('register',[UserAuthController::class,'register']);
Route::get('/refresh-token',[UserAuthController::class,'refresh']);
Route::get('/get-product-data/{id?}',[ProductController::class,'showProduct']);

Route::group(['middleware' => ['jwt.role:users','jwt.auth']],function ()
{
    // auth api
    Route::post('/password-change',[UserAuthController::class,'passwordChange']);
    Route::post('/password-check',[UserAuthController::class,'passwordCheck']);
	Route::post('/logout',[UserAuthController::class,'logout']);
    Route::get('/user',[UserAuthController::class,'user']);

    // cart api
    Route::post('/add-to-cart',[ProductController::class,'addCart']);
    Route::get('/get-cart-data/{id}',[ProductController::class,'showCart']);
    Route::get('/remove-from-cart/{id}',[ProductController::class,'removeCart']);

    //Product api



    //user test sschedule
    Route::get('/get-user-purchases/{id?}/{ts_id?}',[UserController::class,'getTSPurchases']);
    Route::post('/post-user-test-status',[UserController::class,'userTestStatus']);
    Route::get('/generate-question/{id}',[UserController::class,'generateRandomQuestion']);


});
