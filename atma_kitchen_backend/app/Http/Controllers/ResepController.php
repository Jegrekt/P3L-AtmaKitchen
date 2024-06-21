<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiFailedResponse;
use App\Http\Resources\ApiResponse;
use App\Models\Produk;
use App\Models\ProdukBahan;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class ResepController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, Produk $produk)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $reseps = ProdukBahan::with(['bahan_baku'])->where('id_produk', $produk->id);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $reseps->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $reseps->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $reseps = $reseps->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($reseps, "Berhasil menampilkan daftar resep");
    }

    private function cekProduk(Produk $produk) {
        if ($produk->id_kategori == 4 || $produk->id_kategori == 5) {
            throw ValidationException::withMessages([
                'id_produk' => 'Produk ini tidak bisa memiliki resep',
            ]);
        }
    }

    private function cekProdukResep(Produk $produk, ProdukBahan $resep = null) {
        $this->cekProduk($produk);
        if ($produk->id != $resep->id_produk) {
            throw ValidationException::withMessages([
                'id_produk' => 'Resep tidak ditemukan',
            ]);
        }
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, Produk $produk, ProdukBahan $resep = null) {
        $request->validate([
            'id_bahan_baku' => 'required|integer|min:1',
            'qty' => 'required|integer|min:1',
        ]);

        $id_bahan_baku = $request->input("id_bahan_baku");
        $qty = $request->input("qty");

        if ($resep) {
            // Update
            $resep->id_bahan_baku = $id_bahan_baku;
            $resep->qty = $qty;
            $resep->update();
        } else {
            // Create
            // Pastikan tidak ada bahan yang sama
            $duplicate = ProdukBahan::where('id_produk', $produk->id)
                ->where('id_bahan_baku', $id_bahan_baku)
                ->first();
            if ($duplicate) {
                throw ValidationException::withMessages([
                    'id_bahan_baku' => "Bahan baku sudah ada di resep. Silahkan update pada ID $duplicate->id",
                ]);
            }

            $resep = new ProdukBahan([
                'id_bahan_baku' => $id_bahan_baku,
                'qty' => $qty,
                'id_produk' => $produk->id,
            ]);
            $resep->save();
        }

        return new ApiResponse($resep, "Berhasil menambahkan bahan baku ke dalam resep");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, Produk $produk)
    {
        $this->cekProduk($produk);
        return $this->createOrUpdate($request, $produk);
    }

    /**
     * Display the specified resource.
     */
    public function show(Produk $produk, ProdukBahan $resep)
    {
        $this->cekProdukResep($produk, $resep);
        return new ApiResponse(ProdukBahan::find($resep->id), "Berhasil menampilkan resep");
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Produk $produk, ProdukBahan $resep)
    {
        $this->cekProdukResep($produk, $resep);
        return $this->createOrUpdate($request, $produk, $resep);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Produk $produk, ProdukBahan $resep)
    {
        $this->cekProdukResep($produk, $resep);
        $resep->delete();
        return new ApiResponse(null, "Berhasil menghapus resep");
    }

    /**
     * Store all (array)
     */
    public function storeAll(Request $request, Produk $produk)
    {
        $request->validate([
            'resep' => 'required|array',
            'resep.*.id_bahan_baku' => 'required|integer|min:1',
            'resep.*.qty' => 'required|integer|min:1',
        ]);

        $this->cekProduk($produk);

        $resepList = $request->input('resep');

        $dataSemuaResep = [];
        $idSemuaResep = [];
        foreach ($resepList as $produkBahan) {
            $id_bahan_baku = $produkBahan['id_bahan_baku'];
            $qty = $produkBahan['qty'];

            $resep = ProdukBahan::where('id_produk', $produk->id)
                ->where('id_bahan_baku', $id_bahan_baku)
                ->first();
            if ($resep) {
                $resep->qty = $qty;
                $resep->update();
            } else {
                $resep = new ProdukBahan([
                    'id_bahan_baku' => $produkBahan['id_bahan_baku'],
                    'qty' => $produkBahan['qty'],
                    'id_produk' => $produk->id,
                ]);
                $resep->save();
            }

            $dataSemuaResep[] = $resep;
            $idSemuaResep[] = $resep->id;
        }

        // Hapus resep yang tidak ada di request
        ProdukBahan::whereRaw("id_produk = $produk->id AND id NOT IN (" . implode(",", $idSemuaResep) . ")")->delete();

        return new ApiResponse($dataSemuaResep, "Berhasil menambahkan resep");
    }
}