<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserTestStatus extends Model
{
    use HasFactory;

    protected $table = 'user_test_status';
    public $timestamps = false;
    protected $fillable = [
        'q_id',
        'status_id',
        'test_answer',
        'uts_id',
        'test_time',

    ];

    protected $casts = [
        'id'=>'integer',
        'q_id' => 'integer',
        'status_id' => 'integer',
        'uts_id' => 'integer',
    ];
    public function questions(): BelongsTo
    {
        return $this->belongsTo(VerbalQuestion::class, 'q_id', 'id');
    }
    public function UserTestSeries(): BelongsTo
    {
        return $this->belongsTo(UserTestSeries::class, 'uts_id', 'id');
    }
}
