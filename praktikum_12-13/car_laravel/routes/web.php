<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CarController;
Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');

    
 
Route::middleware(['auth'])->group(function () {
    Route::resource('car', CarController::class);
});
require __DIR__.'/auth.php';
