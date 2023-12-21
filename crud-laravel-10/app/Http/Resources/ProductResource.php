<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'image' => $this->image,
            'nama' => $this->nama,
            'harga' => $this->harga,
            'stock' => $this->stock,
            'jenis' => $this->jenis,
            'kadaluarsa' => $this->kadaluarsa,
            'berat' => $this->berat,
            'rating' => $this->rating,
            'reviews' => ReviewResource::collection($this->whenLoaded('reviews'))
        ];
    }
}
