<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\Penitip;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class PenitipController extends Controller
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

        $penitips = Penitip::query();

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $penitips->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $penitips->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $penitips = $penitips->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($penitips, "Berhasil menampilkan daftar penitip");
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, Penitip $penitip = null) {
        $request->validate([
            'nama' => 'required|string',
            'alamat' => 'required|string',
            'no_telp' => 'required|string',
        ]);

        if ($penitip == null) {
            $penitip = new Penitip();
        }

        $penitip->nama = $request->input('nama');
        $penitip->alamat = $request->input('alamat');
        $penitip->no_telp = $request->input('no_telp');
        $penitip->save();

        return $penitip;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $penitip = $this->createOrUpdate($request);
        return new ApiResponse($penitip, "Berhasil menambahkan penitip $penitip->nama");
    }

    /**
     * Display the specified resource.
     */
    public function show(Penitip $penitip)
    {
        $penitip->load('produks');
        return new ApiResponse($penitip);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Penitip $penitip)
    {
        $penitip = $this->createOrUpdate($request, $penitip);
        return new ApiResponse($penitip, "Berhasil mengupdate penitip $penitip->nama");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Penitip $penitip)
    {
        if ($penitip->produks()->count() > 0) {
            throw ValidationException::withMessages([
                'penitip' => "Tidak bisa menghapus penitip $penitip->nama karena memiliki produk",
            ]);
        }
        $penitip->delete();
        return new ApiResponse(null, "Berhasil menghapus penitip $penitip->nama");
    }
}
