<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\HistorySaldo;
use Illuminate\Validation\ValidationException;

class HistorySaldoController extends Controller
{
    function listCustomer(Request $request)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $historySaldos = HistorySaldo::where('id_customer', auth()->user()->id);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $historySaldos->where('catatan', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $historySaldos->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $historySaldos = $historySaldos->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($historySaldos, "Berhasil menampilkan daftar history saldo");
    }

    function requestPenarikanSaldo(Request $request)
    {
        $request->validate([
            'nominal' => 'required|integer|gt:0',
            'catatan' => 'nullable|string'
        ]);

        $customer = Customer::find(auth()->user()->id);
        $nominal = $request->input('nominal');

        if (!$customer || $customer->saldo < $nominal) {
            throw ValidationException::withMessages([
                'nominal' => 'Saldo tidak mencukupi. Saldo saat ini: ' . ($customer ? $customer->saldo : 0),
            ]);
        }

        $catatan = $request->input('catatan');

        $historySaldo = new HistorySaldo([
            'id_customer' => auth()->user()->id,
            'timestamp' => now(),
            'nominal' => -$nominal,
            'saldo_akhir' => $customer->saldo - $nominal,
            'catatan' => "Penarikan saldo" . ($catatan ? ": $catatan" : ""),
            'diproses' => 0
        ]);

        $historySaldo->save();

        // Update saldo customer
        $customer->saldo -= $nominal;
        $customer->save();

        return new ApiResponse($historySaldo, "Berhasil mengajukan penarikan saldo");
    }

    function listAdmin(Request $request)
    {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $historySaldos = HistorySaldo::with('customer.user')->where('diproses', 0);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $historySaldos->where('catatan', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $historySaldos->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $historySaldos = $historySaldos->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($historySaldos, "Berhasil menampilkan daftar history saldo yang belum diproses");
    }

    function approvePenarikanSaldo(Request $request, HistorySaldo $historySaldo)
    {
        if ($historySaldo->diproses) {
            throw ValidationException::withMessages([
                'id' => 'History saldo sudah diproses'
            ]);
        }

        $historySaldo->diproses = 1;
        $historySaldo->save();

        return new ApiResponse($historySaldo, "Berhasil menyetujui dan mentransfer penarikan saldo");
    }
}
