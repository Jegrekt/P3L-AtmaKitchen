<?php

namespace App\Http\Controllers;

use App\Http\Resources\ApiFailedResponse;
use App\Http\Resources\ApiResponse;
use App\Mail\PasswordResetMail;
use App\Models\Alamat;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\ValidationException;
use Laravel\Sanctum\PersonalAccessToken;

class AuthController extends Controller
{
    // Login
    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $token = $user->createToken('api_token', [$user->role])->plainTextToken;

            return new ApiResponse([
                'user' => $user,
                'token' => $token,
            ]);
        }

        throw ValidationException::withMessages([
            'username' => __('auth.failed'),
        ]);
    }

    // Logout
    public function logout(Request $request)
    {
        $user = $request->user();
        $user->tokens()->delete();

        return new ApiResponse(null, "Berhasil logout");
    }

    // Register
    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|email|unique:users',
            'password' => 'required',
            'name' => 'required|string',
            'no_telp' => 'required|string|regex:/^08[0-9]{9,}$/',
            'alamat' => 'required|string',
            'tanggal_lahir' => 'required|date|before:today',
        ]);

        $user = User::create([
            'role' => 'c',
            'username' => $request->input('username'),
            'password' => Hash::make($request->input('password')),
            'name' => $request->input('name'),
        ]);

        $user->customer()->create([
            'tanggal_lahir' => $request->input('tanggal_lahir'),
            'no_telp' => $request->input('no_telp'),
            'poin' => 0,
            'saldo' => 0,
        ]);

        $alamat = new Alamat([
            'id_customer' => $user->id,
            'alamat' => $request->input('alamat'),
        ]);
        $alamat->save();

        return new ApiResponse($user, "Berhasil register");
    }

    // Change password (untuk yang sudah login)
    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required',
        ]);

        $user = $request->user();

        if (!Hash::check($request->input('old_password'), $user->password)) {
            throw ValidationException::withMessages([
                'old_password' => 'Password lama salah',
            ]);
        }

        $user->password = Hash::make($request->input('new_password'));
        $user->save();

        return new ApiResponse(null, "Berhasil mengganti password");
    }

    // Forget password (email)
    public function sendPasswordReset(Request $request) {
        $request->validate([
            'username' => 'required|email',
        ]);

        $user = User::where('username', $request->input('username'))->where('role', 'c')->firstOrFail();

        $token = $user->createToken('reset_password', ['reset_password'], now()->addMinutes(15))->plainTextToken;

        // Kirim email
        Mail::to($user->username)->send(new PasswordResetMail($token, $user));

        return new ApiResponse(null, "Berhasil mengirim email reset password. Silahkan cek email anda");
    }

    // Reset password (from email, with token from personal access token, ability = reset_password)
    public function resetPassword(Request $request) {
        $request->validate([
            'username' => 'required|email',
            'token' => 'required',
            'password' => 'required',
        ]);

        $pat = PersonalAccessToken::findToken($request->input('token'));
        if (!$pat || $pat->cant('reset_password')) {
            throw ValidationException::withMessages([
                'token' => 'Token tidak valid',
            ]);
        }

        $user = $pat->tokenable; // ->tokenable mendapatkan user
        if ($user == null) {
            throw ValidationException::withMessages([
                'username' => 'User tidak valid',
            ]);
        }

        if ($user->username != $request->input('username')) {
            return new ApiFailedResponse(null, "User tidak valid");
        }

        $user->password = Hash::make($request->input('password'));
        $user->save();

        // Set token expired
        $pat->delete();

        return new ApiResponse(null, "Berhasil mereset password");
    }
}
