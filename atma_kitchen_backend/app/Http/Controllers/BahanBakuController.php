<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\BahanBaku;
use Illuminate\Http\Request;

class BahanBakuController extends Controller
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

        $bahanBakus = BahanBaku::query();

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $bahanBakus->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $bahanBakus->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $bahanBakus = $bahanBakus->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($bahanBakus, "Berhasil menampilkan daftar bahan baku");
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, BahanBaku $bahanBaku = null) {
        $request->validate([
            'nama' => 'required|string',
            'satuan' => 'required|string'
        ]);

        $nama = $request->input("nama");
        $satuan = $request->input("satuan");

        if ($bahanBaku == null) {
            $bahanBaku = new BahanBaku();
            $bahanBaku->stok = 0;
        }

        $bahanBaku->nama = $nama;
        $bahanBaku->satuan = $satuan;
        $bahanBaku->save();

        return new ApiResponse($bahanBaku, "Berhasil menambahkan bahan baku");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return $this->createOrUpdate($request);
    }

    /**
     * Display the specified resource.
     */
    public function show(BahanBaku $bahanBaku)
    {
        return new ApiResponse($bahanBaku, "Berhasil menampilkan bahan baku");
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, BahanBaku $bahanBaku)
    {
        return $this->createOrUpdate($request, $bahanBaku);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BahanBaku $bahanBaku)
    {
        $bahanBaku->produk_bahans()->delete();
        $bahanBaku->trx_pembelian_bbs()->delete();
        $bahanBaku->trx_pemakaian_bbs()->delete();
        $bahanBaku->delete();
        return new ApiResponse(null, "Berhasil menghapus bahan baku");
    }
}
