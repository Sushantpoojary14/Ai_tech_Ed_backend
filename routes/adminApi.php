<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;


Route::post('/admin/login',[AdminAuthController::class,'login']);

Route::group(['prefix' => 'admin','middleware' => ['jwt.role:admin','jwt.auth']],function ()
{

	Route::post('/logout',[AdminAuthController::class,'logout']);
    Route::get('/user',[AdminAuthController::class,'user']);

    //test series
    Route::get('/get-test-series',[AdminController::class,'getTestSeries']);
    Route::get('/get-test-series-topics/{id}',[AdminController::class,'getTestSeriesTopics']);
    Route::post('/add-test-series-product',[AdminController::class,'addUpdateProduct']);
    Route::post('/add-test-series-product-topics',[AdminController::class,'addTSProductTopic']);

});

