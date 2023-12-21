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

    public function reviews()
    {
        return $this->hasMany(Review::class, 'product_id');
    }

    public function getImageUrlAttribute()
    {
        if (strpos($this->image, 'http') === 0) {
            return $this->image;
        }
        return asset('storage/posts/' . $this->image);
    }
}
