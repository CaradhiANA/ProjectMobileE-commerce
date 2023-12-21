<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => fake()->randomElement(['1', '2', '3']),
            'product_id' => fake()->randomElement(['1', '2', '3']),
            'text' => fake()->text(),
            'rating' => fake()->randomFloat(0, 0, 5)
        ];
    }
}
