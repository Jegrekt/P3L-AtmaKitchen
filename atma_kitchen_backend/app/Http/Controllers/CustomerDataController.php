<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\TrxPenjualan;

class CustomerDataController extends Controller
{
    public function showProfile(Request $request) {
        $user = $request->user();
        $user->load('customer', 'customer.alamats');

        return new ApiResponse($user);
    }

    public function updateProfile(Request $request) {
        $request->validate([
            'username' => 'required|email',
            'name' => 'required|string',
            'tanggal_lahir' => 'required|date|before:today',
            'no_telp' => 'required|string|regex:/^08[0-9]{9,}$/',
        ]);

        $user = $request->user();
        $user->username = $request->input('username');
        $user->name = $request->input('name');
        $user->save();

        $customer = $user->customer;
        $customer->tanggal_lahir = $request->input('tanggal_lahir');
        $customer->no_telp = $request->input('no_telp');
        $customer->save();

        return new ApiResponse($user, "Berhasil mengupdate profile");
    }

    private function showHistoryPesanan(Request $request, Customer $customer) {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $plls = TrxPenjualan::with(['detail_penjualans.produk', 'alamat'])->where('id_customer', $customer->id_user);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $plls->where(function ($query) use ($search) {
                $query->whereHas('detail_penjualans.produk', function ($query) use ($search) {
                    $query->where('nama', 'like', "%$search%");
                });
                $query->orWhere('no_nota', 'like', "%$search%");
            });
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

        return $plls;
    }

    public function showHistoryPesanan4Customer(Request $request) {
        $user = $request->user();
        $customer = $user->customer;

        $plls = $this->showHistoryPesanan($request, $customer);

        return new ApiResponse($plls, "Wow, ini history pesanan kamu");
    }

    public function showHistoryPesanan4Pegawai(Request $request, Customer $customer) {
        $plls = $this->showHistoryPesanan($request, $customer);

        return new ApiResponse($plls, "Wow, ini history pesanan customer ini");
    }

    public function index(Request $request) {
        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
        ]);

        $customers = Customer::with('user');

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');

            $customers->where(function ($query) use ($search) {
                $query->whereHas('user', function ($query) use ($search) {
                    $query->where('name', 'like', "%$search%");
                });
                $query->orWhere('no_telp', 'like', "%$search%");
            });
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $customers->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $customers = $customers->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($customers, "Success GET ALL Customers");
    }

    public function show(Request $request, Customer $customer) {
        $customer->load('user', 'alamats');

        return new ApiResponse($customer, "Success GET Customer");
    }
}
