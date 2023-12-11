<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    //
    function Register(Request $req)
    {

        try {
            //code...
            $validasi = Validator::make($req->all(), [
                'name' => 'required',
                'password' => 'required|min:8',
                'email' => 'required|email|unique:users',
            ]);

            if ($validasi->fails()) {
                return response()->json($validasi->errors(), 422);
            }

            $cre = new User();
            $cre->name = $req->name;
            $cre->password = Hash::make($req->password);
            $cre->email = $req->email;
            $cre->save();
            $res = [
                'success' => true,
                'status' => 200,
                'message' => 'Pendaftaran Sukses',
                'data' => $cre,
            ];
            return response()->json($res);
        } catch (\Throwable $th) {
            //throw $th;
            $res = [
                'success' => false,
                'status' => 500,
                'message' => $th,
            ];
        }
    }

    function Login(Request $req)
    {
        //tahapan login
        //cek user ada atau tidak
        $user = User::where('email', $req->email)->first();
        if ($user != null && Hash::check($req->password, $user->password)) {
            $token = $user->createToken('Personal Token')->plainTextToken;
            $response = [
                'success' => true,
                'status' => 200,
                'token' => $token,
                'message' => 'Login Sukses',
                'data' => $user
            ];
            return response()->json($response);
        } elseif ($user == null) {
            $response = [
                'success' => false,
                'status' => 500,
                'message' => 'Akun Tidak Ditemukan',
            ];
            return response()->json($response);
        } else {
            $response = [
                'success' => false,
                'status' => 500,
                'message' => 'Email atau Password Salah',
            ];
            return response()->json($response);
        }
    }
}
