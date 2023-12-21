<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreReviewRequest;
use App\Http\Requests\UpdateReviewRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ReviewResource;
use App\Http\Resources\UserResource;
use App\Models\Product;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('review.index', ['reviews' => ReviewResource::collection(Review::with(['user', 'product'])->get()),]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('review.create', [
            'products' => ProductResource::collection(Product::all()),
            'users' => UserResource::collection(User::all())
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreReviewRequest $request)
    {
        Review::create($request->validated());
        return redirect()->route('reviews.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Review $review)
    {
        return view('review.edit', [
            'review' => $review,
            'products' => ProductResource::collection(Product::all()),
            'users' => UserResource::collection(User::all())
        ]);
    }

    /**
     * Update the specified resource in storage
     */
    public function update(UpdateReviewRequest $request, Review $review)
    {
        $review->update($request->validated());
        return redirect()->route('reviews.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Review $review)
    {
        $review->delete();
        return redirect()->route('reviews.index');
    }
}
