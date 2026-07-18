<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\AppleTokenVerifier;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;


class RegisteredUserController extends Controller{
  

    public function create(): View{
      
        return view('auth.register');
      
    }


    public function store(Request $request): RedirectResponse{

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:users,email'],          
            'phone' => ['required', 'string', 'max:12', 'min:6', 'unique:users,phone'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);


        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'role' => 2, 
            'type' => 'customer', 
            'status' => 1,
            'password' => Hash::make($request->password),
            
        ]);
         
    

        if (get_settings('signup_email_verification') == 1) {
             event(new Registered($user));
             Auth::login($user);
             Session::flash('success', get_phrase('Registered successfully!'));
            return redirect(route('verification.notice'));
        } else {
            Session::flash('success', get_phrase('Registered successfully!'));
            return redirect(route('login'));
        }
    }
  
  
  
public function redirect(){
  
    $clientId = config('services.google.client_id');
    $redirectUri = urlencode(config('services.google.redirect'));

    // Required scopes
    $scopes = ['openid','profile','email'];
    $scope = urlencode(implode(' ', $scopes));

    // Random state
    $state = bin2hex(random_bytes(16));
    session(['google_oauth_state' => $state]);

    // Final Google OAuth URL
    $url = "https://accounts.google.com/o/oauth2/v2/auth"
         . "?client_id={$clientId}"
         . "&redirect_uri={$redirectUri}"
         . "&response_type=code"
         . "&scope={$scope}"
         . "&state={$state}";

    return redirect($url);
}




public function callback(Request $request){
  
    $code = $request->input('code');
    $state = $request->input('state');

    // State verification
    if ($state !== session('google_oauth_state')) {
        return redirect('/login')->withErrors('Invalid OAuth state, possible CSRF attempt.');
    }

    if (!$code) {
        return redirect('/login')->withErrors('No code returned from Google');
    }

    // Access Token
    $tokenResponse = Http::asForm()->post('https://oauth2.googleapis.com/token', [
        'client_id'     => config('services.google.client_id'),
        'client_secret' => config('services.google.client_secret'),
        'redirect_uri'  => config('services.google.redirect'),
        'grant_type'    => 'authorization_code',
        'code'          => $code,
    ]);

    if ($tokenResponse->failed()) {
        return redirect('/login')->withErrors('Failed to get access token from Google');
    }

    $accessToken = $tokenResponse->json('access_token');

    // User Info
    $userInfoResponse = Http::withHeaders([
        'Authorization' => 'Bearer ' . $accessToken,
    ])->get('https://www.googleapis.com/oauth2/v2/userinfo');

    if ($userInfoResponse->failed()) {
        return redirect('/login')->withErrors('Failed to get user info from Google');
    }

    $googleUser = $userInfoResponse->json();
  
    //dd($tokenResponse->json());
  
    $email = $googleUser['email'] ?? null;

    if (!$email) {
        return redirect('/login')->withErrors('Google account has no email.');
    }

    // Check if user exists
    $user = User::where('email', $email)->first();

    if ($user) {
        $updated = false;
        if (!$user->google_id && isset($googleUser['id'])) {
            $user->google_id = $googleUser['id'];
            $updated = true;
        }
        if ((!$user->avatar || $user->avatar == '') && isset($googleUser['picture'])) {
            $user->avatar = $googleUser['picture'];
            $updated = true;
        }
        if ($updated) {
            $user->save();
        }
    } else {
        // First-time login: create user with Google ID & avatar
        $user = User::create([
            'name'      => $googleUser['name'] ?? 'Google User',
            'email'     => $email,
            'role'      => 2,
            'type'      => 'customer',
            'status'    => 1,
            'google_id' => $googleUser['id'] ?? null,
            'avatar'    => $googleUser['picture'] ?? null,
            'password'  => Hash::make(Str::random(32)),
        ]);
    }

    // Login the user
    Auth::login($user, true);
    Session::flash('success', 'Logged in successfully!');

    return redirect('/customer/wishlist');
}

public function facebookRedirect(){
    $clientId = config('services.facebook.client_id');
    $redirectUri = config('services.facebook.redirect');

    // Required scopes
    $scopes = ['email', 'public_profile'];
    $scope = implode(',', $scopes);

    // Random state
    $state = bin2hex(random_bytes(16));
    session(['facebook_oauth_state' => $state]);

    // Final Facebook OAuth URL
    $url = "https://www.facebook.com/v19.0/dialog/oauth"
         . "?client_id={$clientId}"
         . "&redirect_uri=" . urlencode($redirectUri)
         . "&response_type=code"
         . "&scope={$scope}"
         . "&state={$state}";

    return redirect($url);
}


public function facebookCallback(Request $request)
{
    $code = $request->input('code');
    $state = $request->input('state');

    // State verification
    if ($state !== session('facebook_oauth_state')) {
        return redirect('/login')->withErrors('Invalid OAuth state, possible CSRF attempt.');
    }

    if (!$code) {
        return redirect('/login')->withErrors('No code returned from Facebook');
    }

    // 🔹 Exchange code for access token (use GET with query params)
    $tokenResponse = Http::get('https://graph.facebook.com/v19.0/oauth/access_token', [
        'client_id'     => config('services.facebook.client_id'),
        'client_secret' => config('services.facebook.client_secret'),
        'redirect_uri'  => config('services.facebook.redirect'),
        'code'          => $code,
    ]);

    if ($tokenResponse->failed()) {
        return redirect('/login')->withErrors('Failed to get access token from Facebook');
    }

    $accessToken = $tokenResponse->json('access_token');

    // 🔹 Fetch user info (correct way with query params)
    $userInfoResponse = Http::get('https://graph.facebook.com/me', [
        'fields'       => 'id,name,email,picture',
        'access_token' => $accessToken,
    ]);

    if ($userInfoResponse->failed()) {
        return redirect('/login')->withErrors('Failed to get user info from Facebook');
    }

    $fbUser = $userInfoResponse->json();
    $email = $fbUser['email'] ?? null;

    if (!$email) {
        return redirect('/login')->withErrors('Facebook account has no email.');
    }

    // 🔹 Check if user exists
    $user = User::where('email', $email)->first();
  
  

    if ($user) {
        $updated = false;
        if (!$user->facebook_id && isset($fbUser['id'])) {
            $user->facebook_id = $fbUser['id'];
            $updated = true;
        }
        if ((!$user->avatar || $user->avatar == '') && isset($fbUser['picture']['data']['url'])) {
            $user->avatar = $fbUser['picture']['data']['url'];
            $updated = true;
        }
        if ($updated) {
            $user->save();
        }
    } else {
        // 🔹 First-time login: create user
        $user = User::create([
            'name'        => $fbUser['name'] ?? 'Facebook User',
            'email'       => $email,
            'role'        => 2,
            'type'        => 'customer',
            'status'      => 1,
            'facebook_id' => $fbUser['id'] ?? null,
            'avatar'      => $fbUser['picture']['data']['url'] ?? null,
            'password'    => Hash::make(Str::random(32)),
        ]);
    }

    // 🔹 Login the user
    Auth::login($user, true);
    Session::flash('success', 'Logged in successfully with Facebook!');

    return redirect('/customer/wishlist');
}


public function appleLogin(Request $request, AppleTokenVerifier $appleTokenVerifier)
{
    $request->validate([
        'id_token' => ['required', 'string'],
    ]);

    try {
        $claims = $appleTokenVerifier->verify($request->id_token);
    } catch (\RuntimeException $e) {
        return response()->json([
            'status' => false,
            'message' => $e->getMessage(),
        ], 401);
    }

    $appleId = $claims['sub'];
    $email = $claims['email'] ?? null;

    if (! $email) {
        return response()->json([
            'status' => false,
            'message' => 'Apple account did not provide an email address.',
        ], 422);
    }

    // 1. Apple ID se check
    $user = User::where('apple_id', $appleId)->first();

    // 2. Existing email account se check aur Apple ID link
    if (! $user) {
        $user = User::where('email', $email)->first();

        if ($user && ! $user->apple_id) {
            $user->update([
                'apple_id' => $appleId,
            ]);
        }
    }

    // 3. New Apple user create
    if (! $user) {
        $user = User::create([
            'name' => Str::before($email, '@'),
            'email' => $email,
            'role' => 2,
            'type' => 'customer',
            'status' => 1,
            'apple_id' => $appleId,
            'password' => Hash::make(Str::random(40)),
        ]);
    }

    $token = $user->createToken('mobile-app')->plainTextToken;

    return response()->json([
        'status' => true,
        'message' => 'Login successful',
        'token' => $token,
        'user' => [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'phone' => $user->phone,
        ],
    ], 200);
}



  
}
