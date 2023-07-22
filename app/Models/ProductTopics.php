<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTopics extends Model
{
    use HasFactory;

    protected $table = 'product_topics';

    protected $fillable =[
        'tsp_id' ,
        't_id' ,

    ];
}
