<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\Ketidakhadiran;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class KetidakhadiranController extends Controller
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
            'bulan' => 'nullable|integer|min:1|max:12',
            'tahun' => 'nullable|integer|min:2000|max:2100',
        ]);

        $absensis = Ketidakhadiran::with(['pegawai.user']);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $absensis->whereHas('pegawai', function ($query) use ($search) {
                $query->where('nama', 'like', "%$search%");
            });
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $absensis->orderBy($sort);
        } else {
            // order by tanggal ASC
            $absensis->orderBy('tanggal', 'asc');
        }

        // Filter
        if ($request->has('bulan')) {
            $bulan = $request->input('bulan');
            $absensis->whereMonth('tanggal', $bulan);
        }

        if ($request->has('tahun')) {
            $tahun = $request->input('tahun');
            $absensis->whereYear('tanggal', $tahun);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $absensis = $absensis->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($absensis, "Berhasil menampilkan daftar ketidakhadiran");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'id_pegawai' => 'required|integer',
            'tanggal' => 'required|date|before_or_equal:today',
        ]);

        $pegawai = Pegawai::find($request->input('id_pegawai'));
        if (!$pegawai) {
            throw ValidationException::withMessages([
                'id_pegawai' => 'Pegawai tidak ditemukan',
            ]);
        }

        $absensi = Ketidakhadiran::where('id_pegawai', $request->input('id_pegawai'))
            ->where('tanggal', $request->input('tanggal'))
            ->first();

        if ($absensi) {
            throw ValidationException::withMessages([
                'id_pegawai' => "Pegawai sudah memiliki ketidakhadiran pada tanggal $absensi->tanggal",
            ]);
        }

        $absensi = new Ketidakhadiran();

        $absensi->id_pegawai = $request->input('id_pegawai');
        $absensi->tanggal = $request->input('tanggal');

        $absensi->save();

        return new ApiResponse($absensi, "Berhasil menambahkan ketidakhadiran pegawai pada tanggal $absensi->tanggal");
    }

    /**
     * Display the specified resource.
     */
    public function show(Ketidakhadiran $absensi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Ketidakhadiran $absensi)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Ketidakhadiran $absensi)
    {
        $absensi->delete();

        return new ApiResponse(null, "Berhasil menghapus ketidakhadiran pegawai pada tanggal $absensi->tanggal");
    }
}
