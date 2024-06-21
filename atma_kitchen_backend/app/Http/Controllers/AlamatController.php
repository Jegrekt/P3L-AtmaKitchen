<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiResponse;
use App\Models\Alamat;
use App\Models\Customer;
use App\Models\CustomerMobile;
use Illuminate\Http\Request;
use Kreait\Firebase\Messaging\CloudMessage;

class AlamatController extends Controller
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

        $alamats = Alamat::query();
        if ($request->user()->role == 'c') {
            $alamats->where('id_customer', $request->user()->id);
        } else {
            $alamats->with('customer.user');
        }

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $alamats->where('nama', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $alamats->orderBy($sort);
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $alamats = $alamats->paginate($size, ['*'], 'page', $page);

        return new ApiResponse($alamats, "Berhasil menampilkan daftar alamat");
    }

    public function registerDevice(Request $request) {
        $request->validate([
            'device_id' => 'required|string',
        ]);

        $userId = $request->user()->id;
        $customer = Customer::find($userId);

        if (!$customer) {
            return new ApiResponse(null, "Customer tidak ditemukan", 404);
        }

        $mobile = new CustomerMobile([
            'id_customer' => $userId,
            'token' => $request->input('device_id'),
        ]);

        $mobile->save();

        return new ApiResponse($mobile, "DEPRECATED: Berhasil mendaftarkan device {$request->input('device_id')} untuk customer $userId");
    }

    public function testSendNotif(Request $request) {
        $request->validate([
            'title' => 'required|string', // 'Notifikasi dari Aplikasi
            'text' => 'required|string',
        ]);

        $userId = $request->user()->id;
        $customer = Customer::with('customer_mobiles')->find($userId);

        if (!$customer) {
            return new ApiResponse(null, "Customer tidak ditemukan", 404);
        }

        $firebase = app('firebase.messaging');

        $message = CloudMessage::withTarget('topic', "notif-$userId")
            ->withNotification([
                'title' => $request->input('title'),
                'body' => $request->input('text'),
            ]);

        $response = $firebase->send($message);

        return new ApiResponse($response, "Berhasil mengirim notifikasi ke device customer $userId");
    }
}
