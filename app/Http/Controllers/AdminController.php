<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function getTestSeries(){

        $ts = TestSeries::query()
        ->get();

        $tsc = TestSeriesCategories::query()
        ->get();

        return response()->json([
            'ts' => $ts,
            'tsc' => $tsc,
        ], 200);
    }
}
