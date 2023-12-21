<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\SearchByTextProductRequest;
use App\Http\Requests\SearchProductRequest;
use App\Models\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return ProductResource::collection(Product::with(
            ['reviews' => ['user']]
        )->get());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProductRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProductRequest $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        //
    }





    public function search(SearchProductRequest $request)
    {
        $rating = $request->rating;
        $berat = $request->berat;
        $rangeMin = $request->rangeMin;
        $rangeMax = $request->rangeMax;

        return ProductResource::collection(
            Product::with(['reviews' => ['user']])
                ->when($rating, fn ($query, $rating) => $query->where('rating', $rating))
                ->when($berat, fn ($query, $berat) => $query->where('berat', $berat))
                ->when($rangeMin, fn ($query, $rangeMin) => $query->where('harga', '>=', $rangeMin))
                ->when($rangeMax, fn ($query, $rangeMax) => $query->where('harga', '<=', $rangeMax))
                ->get()
        );
    }

    public function searchByText(SearchByTextProductRequest $request)
    {
        return ProductResource::collection(
            Product::with(['reviews' => ['user']])->where('nama', 'like', '%' . $request->nama . '%')->get()
        );
    }
}
