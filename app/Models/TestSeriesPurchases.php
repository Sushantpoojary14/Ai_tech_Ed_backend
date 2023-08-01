<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TestSeriesPurchases extends Model
{
    use HasFactory;

    protected $table = "test_series_purchases";

    protected $fillable=[
        'user_id',
        'tsp_id',
        'valid_from',
        'valid_till',
    ];

    protected $casts = [
        'id'=>'integer',
        'tsp_id' => 'integer',
        'user_id' => 'integer',
      ];
    public function tsProduct(): BelongsTo
    {
        return $this->belongsTo(TestSeriesProduct::class, 'tsp_id', 'id');
    }

    public function uTestUser(): HasMany
    {
        return $this->HasMany(UserTestSeries::class, 'tsps_id', 'id');
    }
}
