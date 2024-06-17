<?php
use App\Http\Controllers\ItemsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/produtos', function (Request $request) {});
Route::post('/produtos', function (Request $request) {});
Route::put('/produtos/{id}', function (Request $request) {});
Route::delete('/produtos/{id}', function (Request $request) {});

Route::apiResource('itens', 'ItemsController', ['only' => ['index', 'create', 'delete', 'update' ]]);
