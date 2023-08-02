<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TSPCTopics extends Model
{
    use HasFactory;

    protected $table = 'ts_pc_topics';

    protected $fillable = [
       'tsp_id',
       'tst_id',
       'set_number'
    ];
    protected $casts = [
        'id'=>'integer',
        'tsp_id' => 'integer',
        'tst_id' => 'integer',
        'set_number'=> 'integer',
    ];
}

