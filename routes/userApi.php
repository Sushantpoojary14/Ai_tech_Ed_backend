<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserAuthController;
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

Route::group(['middleware' => ['jwt.role:users','jwt.auth']],function ()
{
    Route::post('/password-change',[UserAuthController::class,'passwordChange']);
    Route::post('/password-check',[UserAuthController::class,'passwordCheck']);
	Route::post('/logout',[UserAuthController::class,'logout']);
    Route::get('/user',[UserAuthController::class,'user']);
});
