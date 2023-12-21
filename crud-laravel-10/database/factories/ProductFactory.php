<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'image' => fake()->imageUrl(),
            'nama' => fake()->word(),
            'harga' => fake()->randomNumber(),
            'stock' => fake()->randomNumber(),
            'jenis' => fake()->randomElement(['Tempe', 'BuahBuahan', 'Umbi']),
            'kadaluarsa' => fake()->date(),
            'berat' => fake()->randomElement([100, 200, 300, 400, 500]),
            'rating' => fake()->randomElement([1, 2, 3, 4, 5])
        ];
    }
}
