<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

use Tymon\JWTAuth\Contracts\JWTSubject;


class LoginController extends Controller
{
    public function login(Request $request)
    {
        $input = $request->only('email', 'password');
        $jwt_token = null;
        if (!$jwt_token = JWTAuth::attempt($input)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid Email or Password',
            ], 401);
        }
        // get the user 
        $user = Auth::user();
       
        return response()->json([
            'success' => true,
            'token' => $jwt_token,
            'user' => $user
        ]);
    }
    public function simpanreg(Request $request){
        $user = new User();
        $user->email=$request->post('email');
        $user->password=bcrypt($request->post('password'));
        if($user->save()){
            return response()->json([
                'success' =>true,
            ]); 
        }else{
            return response()->json([
                'success' =>false,               
            ]);
        }
    }
    public function logout(Request $request)
    {
        if(!User::checkToken($request)){
            return response()->json([
             'message' => 'Token is required',
             'success' => false,
            ],422);
        }
        
        try {
            JWTAuth::invalidate(JWTAuth::parseToken($request->token));
            return response()->json([
                'success' => true,
                'message' => 'User logged out successfully'
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, the user cannot be logged out'
            ], 500);
        }
    }
}
