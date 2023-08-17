<?php


use App\Http\Controllers\ProductController;
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
    Route::post('/add-test-series-topics',[AdminController::class,'addTSTopic']);
    Route::get('/show-product/{ts_id}',[AdminController::class,'showProduct']);
    Route::get('/show-product-details/{p_id}',[AdminController::class,'showProductDetails']);
    Route::post('/update-product-status/{p_id}',[ProductController::class,'productStatus']);
    Route::post('/update-set-status/{set_id}',[ProductController::class,'setStatus']);
    Route::get('/show-topics/{tsc_id}',[ProductController::class,'showTopics']);
    //product

});

Route::get('/api-key',[AdminController::class,'generateApiKey']);
