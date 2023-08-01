<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\VerbalQuestion>
 */
class VerbalQuestionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $array = array('A','B','C','D');
        $answer=$array[rand(0, 3)];
        return [
            'question'=>fake()->sentence,
            'A'=> fake()->numberBetween(10, 50),
            'B'=> fake()->numberBetween(10, 50),
            'C'=> fake()->numberBetween(10, 50),
            'D'=> fake()->numberBetween(10, 50),
            'E'=> fake()->numberBetween(10, 50),
            'answer'=> $answer,
            'explanation'=>fake()->sentence,
            'ts_id'=> rand(1, 2),
            'tsc_id'=> rand(1, 3),
            'tst_id'=> rand(1, 15),
            'marks'=>1,
        ];
    }
}
