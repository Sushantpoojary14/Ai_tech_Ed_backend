<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestSeriesCategories extends Model
{
    use HasFactory;

    protected $table = "test_series_categories";

    protected $fillable=[
        'tsc_type'
    ];

}
