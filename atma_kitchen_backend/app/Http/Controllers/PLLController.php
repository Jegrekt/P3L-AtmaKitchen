<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\PengeluaranLainLain;
use Illuminate\Http\Request;

class PLLController extends Controller
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
            'deleted' => 'nullable|boolean'
        ]);

        $plls = PengeluaranLainLain::query();

        // Deleted
        if ($request->has('deleted')) {
            $deleted = $request->input('deleted');
            $plls->where('flag_delete', $deleted);
        } else {
            $plls->where('flag_delete', 0);
        }

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $plls->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $plls->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $plls = $plls->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($plls, "Berhasil menampilkan daftar pengeluaran lain-lain");
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, PengeluaranLainLain $pll = null) {
        $request->validate([
            'nama' => 'required|string',
            'nominal' => 'required|integer',
            'tanggal_pengeluaran' => 'required|date|before_or_equal:today',
        ]);

        $data = [
            'nama' => $request->input('nama'),
            'nominal' => $request->input('nominal'),
            'tanggal_pengeluaran' => $request->input('tanggal_pengeluaran'),
        ];

        if ($pll == null) {
            $pll = new PengeluaranLainLain($data);
            $pll->save();
        } else {
            $pll->fill($data);
            $pll->update();
        }

        return $pll;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $pll = $this->createOrUpdate($request);
        return new ApiResponse($pll, "Berhasil menambahkan pengeluaran lain-lain");
    }

    /**
     * Display the specified resource.
     */
    public function show(PengeluaranLainLain $pll)
    {
        return new ApiResponse($pll, "Berhasil menampilkan pengeluaran lain-lain $pll->nama");
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PengeluaranLainLain $pll)
    {
        $pll = $this->createOrUpdate($request, $pll);
        return new ApiResponse($pll, "Berhasil mengupdate pengeluaran lain-lain $pll->nama");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PengeluaranLainLain $pll)
    {
        // $pll->delete();
        $pll->flag_delete = 1;
        $pll->update();
        return new ApiResponse(null, "Berhasil menandai pengeluaran lain-lain $pll->nama sebagai dihapus");
    }
}
