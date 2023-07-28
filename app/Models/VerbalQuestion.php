<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VerbalQuestion extends Model
{
    use HasFactory;
    protected $table = 'verbal_question';

    protected $fillable = [
        'question',
        'A',
        'B',
        'C',
        'D',
        'E',
        'answer',
        'explanation',
        'ts_id',
        'tsc_id',
        'tst_id',
        'marks',
        'status'

    ];
    protected $casts = [
        'id'=>'integer',
        'ts_id' => 'integer',
        'tsc_id' => 'integer',
        'tst_id' => 'integer',
        'status' => 'integer',
        'marks' => 'integer',
    ];

}
