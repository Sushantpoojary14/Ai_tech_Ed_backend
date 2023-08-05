<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserTestSeries extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table='user_test_series';

    protected $fillable=[
        'tsps_id',
        'user_id',
        'complete_status',
        'start_date',
        'end_date',
        'time_taken',
        'current_timer',
        'q_id'
    ];

    protected $casts = [
        'id'=>'integer',
        'q_id' => 'integer',
        'tsps_id' => 'integer',
        'user_id' => 'integer',
        'complete_status' => 'integer',
      ];
    public function userPurchases(): BelongsTo
    {
        return $this->belongsTo(TestSeriesPurchases::class, 'tsps_id', 'id');
    }


}
