<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::get('/images/{filename}', function($filename) {
    $path = public_path('images/' . $filename);

    if (!file_exists($path)) {
        abort(404);
    }

    return response()->file($path);
});

Route::get('/', function () {

    return response([
        "message"=>"working"
    ]);
});
require __DIR__.'\adminApi.php';
require __DIR__.'\userApi.php';

// require __DIR__ . DIRECTORY_SEPARATOR . 'adminApi.php';
// require __DIR__ . DIRECTORY_SEPARATOR . 'userApi.php';
