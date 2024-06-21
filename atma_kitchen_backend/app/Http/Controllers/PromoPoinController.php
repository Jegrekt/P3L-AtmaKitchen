<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\PromoPoin;
use Illuminate\Http\Request;

class PromoPoinController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $promos = PromoPoin::query();

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $promos->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $promos->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $promos = $promos->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($promos, "Success get promos");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(PromoPoin $promoPoin)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PromoPoin $promoPoin)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PromoPoin $promoPoin)
    {
        //
    }
}
