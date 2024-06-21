<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Pegawai;
use App\Http\Resources\ApiResponse;
use App\Models\Role;
use Illuminate\Validation\ValidationException;
use Laravel\Sanctum\PersonalAccessToken;

class PegawaiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // Cek ability
        $hideBonusDanGaji = true;
        $roleStr = 'kar';
        if(PersonalAccessToken::findToken($request->bearerToken())->can('own')) {
            $hideBonusDanGaji = false;
            $roleStr = 'kar,adm,mo';
        }

        $request->validate([
            'search' => 'nullable|string',
            'sort' => 'nullable|string',
            'page' => 'nullable|integer|min:1',
            'size' => 'nullable|integer|min:10|max:100',
            'role' => "nullable|string|in:$roleStr"
        ]);

        $pegawais = User::with(['pegawai', 'role_data']);

        // Search
        if ($request->has('search')) {
            $search = $request->input('search');
            $pegawais->where('name', 'like', "%$search%");
        }

        // Sort
        if ($request->has('sort')) {
            $sort = $request->input('sort');
            $pegawais->orderBy($sort);
        }

        // Filter by role
        if ($request->has('role')) {
            $role = $request->input('role');
            $pegawais->where('role', $role);
        } else {
            $pegawais->whereRaw("role IN (" . implode(",", array_map(function($item) {
                return "'" . $item . "'";
            }, explode(",", $roleStr))) . ")");
        }

        // Pagination
        $page = $request->input('page', 1);
        $size = $request->input('size', 10);
        $pegawais = $pegawais->paginate($size, ['*'], 'page', $page);

        if ($hideBonusDanGaji) {
            foreach($pegawais->items() as $pegawai) {
                $pegawai->pegawai->hide(['bonus']);
                $pegawai->role_data->hide(['gaji_dasar_harian']);
            }
        }

        return new ApiResponse($pegawais, "Berhasil menampilkan daftar pegawai");
    }

    /**
     * Pastikan user merupakan pegawai
     */
    private function isPegawai(User $user) {
        if ($user->role == 'c') {
            throw ValidationException::withMessages([
                'pegawai' => 'User bukan pegawai'
            ]);
        }
    }

    /**
     * Create & Update dari satu method
     */
    private function createOrUpdate(Request $request, User $user = null) {
        $request->validate([
            'name' => 'required|string',
            // 'role' => 'required|string|in:kar,adm,mo',
            'alamat' => 'required|string',
            'no_telp' => 'required|string',
            // 'bonus' => 'required|integer|min:0',  // diubah oleh owner
            'username' => "required|email|unique:users,username" . ($user ? ",$user->id" : ""),
        ]);

        // Data User
        $name = $request->input('name');
        $role = "kar"; // $request->input('role');
        $username = $request->input('username');

        // Data Pegawai
        $alamat = $request->input('alamat');
        $no_telp = $request->input('no_telp');
        $bonus = 0;

        $password = null;
        if ($role != 'kar') {
            $request->validate([
                // unique:table, email_column_to_check, id_to_ignore
                'password' => 'required',
            ]);
            $password = $request->input('password');
        }

        if ($user) {
            // Update
            $user->username = $username;
            $user->password = $password;
            $user->name = $name;
            $user->role = $role;

            $user->pegawai->alamat = $alamat;
            $user->pegawai->no_telp = $no_telp;
            $user->pegawai->bonus = $bonus;

            $user->save();
            $user->pegawai->save();

            return $user;
        } else {
            // Create
            $user = User::create([
                'role' => $role,
                'username' => $username,
                'password' => $password,
                'name' => $name,
            ]);

            $pegawai = $user->pegawai()->create([
                'alamat' => $alamat,
                'no_telp' => $no_telp,
                'bonus' => $bonus,
            ]);

            return $user;
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $this->createOrUpdate($request);

        return new ApiResponse($data, "Berhasil membuat pegawai " . $data->name);
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, User $pegawai)
    {
        $this->isPegawai($pegawai);

        // Cek ability
        $hideBonusDanGaji = true;
        if(PersonalAccessToken::findToken($request->bearerToken())->can('own')) {
            $hideBonusDanGaji = false;
        }

        $user = &$pegawai;
        $user->load(['pegawai', 'role_data']);

        if ($hideBonusDanGaji) {
            $user->pegawai->hide(['bonus']);
            $user->role_data->hide(['gaji_dasar_harian']);
        }

        return new ApiResponse($user, "Berhasil menampilkan detail pegawai " . $user->name);
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $pegawai)
    {
        $this->isPegawai($pegawai);

        $user = &$pegawai;
        $data = $this->createOrUpdate($request, $user);

        return new ApiResponse($data, "Berhasil mengupdate pegawai " . $user->name);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $pegawai)
    {
        $this->isPegawai($pegawai);

        $user = &$pegawai;
        $user->pegawai->delete();
        $user->delete();

        return new ApiResponse(null, "Berhasil menghapus pegawai " . $user->name);
    }

    /**
     * Mengubah Data Gaji (Owner)
     */
    public function updateGajiJabatan(Request $request, Role $jabatan) {
        $request->validate([
            'gaji_dasar_harian' => 'required|integer|min:0',
        ]);

        $jabatan->gaji_dasar_harian = $request->input('gaji_dasar_harian');
        $jabatan->save();

        return new ApiResponse($jabatan, "Berhasil mengubah Gaji Dasar Harian untuk jabatan " . $jabatan->nama);
    }

    /**
     * Mengubah Bonus Karyawan (Owner)
     */
    public function updateBonusKaryawan(Request $request, User $pegawai) {
        $this->isPegawai($pegawai);

        $request->validate([
            'bonus' => 'required|integer|min:0',
        ]);

        $pegawai->pegawai->bonus = $request->input('bonus');
        $pegawai->pegawai->save();

        return new ApiResponse($pegawai, "Berhasil mengubah bonus untuk karyawan " . $pegawai->name);
    }
}
