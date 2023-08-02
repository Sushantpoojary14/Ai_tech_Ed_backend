<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

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
        'duration',
        'test_month_limit',
        'total_question',
        'release_date',
        'status'
    ];

    protected $casts = [
        'id'=>'integer',
        'ts_id' => 'integer',
        'total_question' => 'integer',
        'duration'=> 'integer',
        'status' => 'integer',
      ];

    public function tsProductCategory()
    {
        return $this->belongsToMany(TestSeriesTopics::class, TSProductCategory::class,'tsp_id', 'tsc_id');
    }

}
