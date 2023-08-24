<?php


use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;


Route::post('/admin/login',[AdminAuthController::class,'login']);

Route::group(['prefix' => 'admin','middleware' => ['jwt.role:admin','jwt.auth']],function ()
{
    //Auth
	Route::post('/logout',[AdminAuthController::class,'logout']);
    Route::get('/user',[AdminAuthController::class,'user']);

    //admin
    Route::post('/add-test-series-product',[AdminController::class,'addUpdateProduct']);
    Route::post('/add-test-series-product-topics',[AdminController::class,'addTSProductTopic']);
    Route::post('/add-test-series-topics',[AdminController::class,'addTSTopic']);
    Route::get('/show-product-details/{p_id}',[AdminController::class,'showProductDetails']);
    Route::get('/show-topics/{tsc_id}',[AdminController::class,'showTopics']);
    Route::get('/show-topics-details/{tst_id}',[AdminController::class,'showTopicsDetails']);
    Route::delete('/delete-product/{p_id}',[AdminController::class,'deleteProduct']);
    Route::delete('/delete-set/{set_id}',[AdminController::class,'deleteSet']);
    Route::delete('/delete-topic/{tst_id}',[AdminController::class,'deleteTopic']);
    Route::get('/check-topic/{tst_id}',[AdminController::class,'topicCheck']);
    Route::post('/update-product-status/{p_id}',[AdminController::class,'productStatus']);
    Route::post('/update-set-status/{set_id}',[AdminController::class,'setStatus']);

    //product
    Route::get('/get-test-series',[ProductController::class,'getAdminTestSeries']);
    Route::get('/get-test-series-topics/{id}',[ProductController::class,'getTestSeriesTopics']);
    Route::get('/show-product/{ts_id}',[ProductController::class,'showAdminProduct']);
});

