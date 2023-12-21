<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\PostController;
use \App\Http\Controllers\KaryawanController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\ReviewController;

Route::get('/', fn() => view('welcome'));
Route::resource('/posts', PostController::class);
Route::resource('/karyawan', KaryawanController::class);

//login
// Remove any custom login routes...
// Instead, you can use Auth::routes() to define the default routes
Auth::routes();

Route::resource('reviews', ReviewController::class);
Route::get('/reviews/create', [ReviewController::class, 'create'])->name('review.create');
Route::get('/reviews', [ReviewController::class, 'index'])->name('review.index');
Route::get('reviews/{review}/edit', [ReviewController::class, 'edit'])->name('reviews.edit');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
