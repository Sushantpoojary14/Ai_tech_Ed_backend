<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TestSeriesProduct extends Model
{
    use HasFactory;
    protected $table = "test_series_product";

    protected $fillable = [
        'p_name',
        'p_description',
        'p_price',
        'p_image',
        'ts_id',
        'tsc_id',
        'duration',
        'test_month_limit',
        'total_question',
        'status'
    ];

    // public function topics(): BelongsTo
    // {
    //     return $this->hasMany(TestSeriesCategories::class, 'id',
    //     TestSeriesTopics::class, 'tsc_id', 'tsc_id');
    // }

}
