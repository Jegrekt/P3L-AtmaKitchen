<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\BahanBaku;
use App\Models\TrxPembelianBb;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class PBBController extends Controller
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
            'id_bahan_baku' => 'nullable|integer',
            'deleted' => 'nullable|boolean'
        ]);

        $tpbb = TrxPembelianBb::with('bahan_baku');

        // Deleted
        if ($request->has('deleted')) {
            $deleted = $request->input('deleted');
            $tpbb->where('flag_delete', $deleted);
        } else {
            $tpbb->where('flag_delete', 0);
        }

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $tpbb->where(function ($query) use ($search) {
                // where bahan_baku.nama like %search%
                $query->whereHas('bahan_baku', function ($query) use ($search) {
                    $query->where('nama', 'like', "%$search%");
                });
                // where tanggal_pembelian like %search%
                $query->orWhere('tanggal_pembelian', 'like', "%$search%");
            });
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $tpbb->orderBy($sort);
        } else {
            $tpbb->orderBy('tanggal_pembelian', 'desc');
        }

        // Filter
        if ($request->has('id_bahan_baku')) {
            $id_bahan_baku = $request->input('id_bahan_baku');
            $tpbb->where('id_bahan_baku', $id_bahan_baku);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $tpbb = $tpbb->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($tpbb, "Berhasil menampilkan daftar pembelian bahan baku");
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, TrxPembelianBb $tpbb = null) {
        $request->validate([
            'id_bahan_baku' => 'required|integer',
            'tanggal_pembelian' => 'required|date|before_or_equal:today',
            'harga_satuan' => 'required|integer',
            'qty' => 'required|integer|min:1'
        ]);

        $data = [
            'id_bahan_baku' => $request->input('id_bahan_baku'),
            'tanggal_pembelian' => $request->input('tanggal_pembelian'),
            'harga_satuan' => $request->input('harga_satuan'),
            'qty' => $request->input('qty'),
            'total_harga' => $request->input('harga_satuan') * $request->input('qty')
        ];

        $stokLama = $tpbb ? $tpbb->qty : 0;
        if ($tpbb == null) {
            $tpbb = new TrxPembelianBb($data);
            $tpbb->save();
        } else {
            if ($tpbb->id_bahan_baku != $data['id_bahan_baku']) {
                throw ValidationException::withMessages([
                    'id_bahan_baku' => "Gaboleh begitu bjirr 🗿🗿. Tadinya {$tpbb->bahan_baku->nama}",
                ]);
            }
            $tpbb->fill($data);
            $tpbb->update();
        }

        // Update stok bahan baku
        $bb = BahanBaku::find($data['id_bahan_baku']);
        $bb->stok += $data['qty'] - $stokLama;
        $bb->update();

        $tpbb->load('bahan_baku');
        return $tpbb;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $pbb = $this->createOrUpdate($request);
        return new ApiResponse($pbb, "Berhasil menambahkan pembelian bahan baku " . $pbb->bahan_baku->nama);
    }

    /**
     * Display the specified resource.
     */
    public function show(TrxPembelianBb $pbb)
    {
        $pbb->load('bahan_baku');
        return new ApiResponse($pbb);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TrxPembelianBb $pbb)
    {
        $pbb = $this->createOrUpdate($request, $pbb);
        return new ApiResponse($pbb, "Berhasil mengupdate pembelian bahan baku " . $pbb->bahan_baku->nama);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TrxPembelianBb $pbb)
    {
        $pbb->load('bahan_baku');

        // Balikin stok bahan baku
        $bb = BahanBaku::find($pbb->id_bahan_baku);
        $bb->stok -= $pbb->qty;
        $bb->update();

        $pbb->flag_delete = 1;
        $pbb->update();
        return new ApiResponse(null, "Berhasil menandai hapus untuk pembelian bahan baku " . $pbb->bahan_baku->nama);
    }
}
