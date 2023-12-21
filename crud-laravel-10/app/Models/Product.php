<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'image',
        'nama',
        'harga',
        'stock',
        'jenis',
        'kadaluarsa',
        'berat',
        'rating',
    ];

    public function reviews () {
        return $this->hasMany(Review::class, 'product_id');
    }
}
