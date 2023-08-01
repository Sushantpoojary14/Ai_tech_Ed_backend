<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TestSeriesProduct>
 */
class TestSeriesProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'p_name' => fake()->word,
            'p_description' =>fake()->word,
            'p_price' => fake()->numberBetween(1000, 5000),
            'p_image' => fake()->imageUrl,
            'ts_id' => 1,
            'tsc_id' => rand(1, 3),
            'duration' => 30,
            'test_month_limit'=>rand(1, 3),
            'total_question' => 30,
            'status' => 1
        ];
    }
}
