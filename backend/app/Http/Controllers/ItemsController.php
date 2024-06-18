<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class ItemsController extends Controller
{
    public function index(Request $request){
        // Retrieve all items from the database
        $items = Items::all();
        return response()->json($items);
    }

    public function create(Request $request){
        // Validate the request parameters
        $this->validate($request, [
            'nome' => 'required',
            // Add other fields validation as necessary
        ]);

        // Create a new item and save it to the database
        $items = new Item;
        $items ->nome = $request->nome;
        // Set other fields from the request
        $items->save();

        return response()->json($item, 201);
    }

    public function update(Request $request, $id){
        // Validate the request parameters
        $this->validate($request, [
            'nome' => 'required',
            // Add other fields validation as necessary
        ]);

        // Find the item by id and update it
        $items = Item::findOrFail($id);
        $items ->nome = $request->nome;
        // Update other fields from the request
        $items ->save();

        return response()->json($items);
    }

    public function delete(Request $request, $id){
        // Find the item by id and delete it from the database
        $item = Item::findOrFail($id);
        $item->delete();

        return response()->json(null, 204);
    }
}
