<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserTestSeries extends Model
{
    use HasFactory;

    protected $table='user_test_series';

    protected $fillable=[
        'tsp_id',
        'user_id',
        'complete_status',
        'start_date',
        'end_date',
        'time_taken',

    ];
    public function userPurchases(): BelongsTo
    {
        return $this->belongsTo(TestSeriesPurchases::class, 'tsps_id', 'id');
    }


}
