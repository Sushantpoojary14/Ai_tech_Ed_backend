<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;


Route::post('/admin/login',[AdminAuthController::class,'login']);

Route::group(['prefix' => 'admin','middleware' => ['jwt.role:admin','jwt.auth']],function ()
{

	Route::post('/logout',[AdminAuthController::class,'logout']);
    Route::get('/user',[AdminAuthController::class,'user']);
});

