<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\QuestionImage;

class Question extends Model
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
        'id' => 'integer',
        'tst_id' => 'integer',
        'status' => 'integer',
        'marks' => 'integer',
    ];

    protected function correctOption(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => match (strtolower($value)) {
                'a' => 1,
                'b' => 2,
                'c' => 3,
                'd' => 4,
            }
        );
    }
    protected function option1(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',')

        );
    }
    protected function getCorrectOptionAttribute($value)
    {
        return match ($value) {
            '1' => 'A',
            '2' => 'B',
           '3' => 'C',
           '4' => 'D',
        };
    }


    protected function option2(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',')
        );
    }
    protected function option3(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',')
        );
    }

    protected function option4(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',')
        );
    }

    public function questionImage()
    {
        return $this->HasMany(QuestionImage::class, 'q_id', 'id');
    }
}
