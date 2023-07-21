<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestSeriesTopics extends Model
{
    use HasFactory;
    protected $table = "test_series_topics";

    protected $fillable=[
        't_name',
        'tsc_id',
        'status'

    ];
}
