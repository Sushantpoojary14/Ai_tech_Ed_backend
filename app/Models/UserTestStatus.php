<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserTestStatus extends Model
{
    use HasFactory;

    protected $table='user_test_status';

    protected $fillable=[
        'q_id',
        'status_id',
        'test_answer',
        'uts_id',
        'test_time',

    ];
}
