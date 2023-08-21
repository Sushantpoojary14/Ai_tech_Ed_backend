<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SetQuestion extends Model
{
    use HasFactory;
    protected $table = 'set_questions';
    public $timestamps = false;
    protected $fillable = [
        'set_id',
        'q_id',
    ];
    protected $casts = [
        'set_id' => 'integer',
        'q_id' => 'integer',
    ];

}
