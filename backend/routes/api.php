<?php
use App\Http\Controllers\ItemsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::apiResource('itens', 'ItemsController', ['only' => ['index', 'create', 'delete', 'update' ]]);
