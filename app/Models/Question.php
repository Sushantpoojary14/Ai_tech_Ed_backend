<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class VerbalQuestion extends Model
{
    use HasFactory;
    protected $table = 'question';
    public $timestamps = false;
    protected $fillable = [
        'question',
        'option_1',
        'option_2',
        'option_3',
        'option_4',
        'option_5',
        'correct_option',
        'explanation',
        'tst_id',
        'marks',
        'status'
    ];
    protected $casts = [
        'id'=>'integer',
        'tst_id' => 'integer',
        'status' => 'integer',
        'marks' => 'integer',
    ];

    protected function correctOption(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) => match ($value) {
                'A' => 1,
                'B' => 2,
                'C' => 2,
                'D' => 2,
                default => 5,
            }
        );
    }
    protected function option1(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) =>  rtrim($value, ',')

        );
    }
    protected function option2(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) =>  rtrim($value, ',')
        );
    }
    protected function option3(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) =>  rtrim($value, ',')
        );
    }

    protected function option4(): Attribute
    {
        return Attribute::make(
            set: fn (string $value) =>  rtrim($value, ',')
        );
    }
}
