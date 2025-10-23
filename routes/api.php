<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\JobController;
use App\Http\Controllers\api\ApplicationController;

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('jobs', JobController::class);
    Route::post('/jobs/{job}/apply', [ApplicationController::class, 'apply']);
    Route::get('/jobs/{job}/applications', [ApplicationController::class, 'index']);
    Route::post('/logout', [AuthController::class, 'logout']);
});
