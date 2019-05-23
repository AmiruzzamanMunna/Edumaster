<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Admin;
use App\School;

class AdminController extends Controller
{
	public function insertAdmin(Request $request)
	{
		return view('Admin.adminform');
	}
	public function insertverify(Request $request)
	{
		$admin = new Admin();
		$admin->user_group_id=$request->user_group_id;
		$admin->username=$request->username;
		$admin->password=Hash::make($request->password);
		// dd($admin);
		$admin->salt=$request->salt;
		$admin->firstname=$request->firstname;
		$admin->lastname=$request->lastname;
		$admin->email=$request->email;
		$admin->image=$request->image;
		$admin->code=$request->code;
		$admin->ip=$request->ip;
		$admin->status=$request->status;
		$admin->date_added=$request->date_added;
		$admin->save();
		return back();
	}
	public function login(Request $request)
	{
		$data1=rand(0,9);
		$data2=rand(0,9);
		return view('Admin.login')
				->with('data1',$data1)
				->with('data2',$data2);
	}
    public function index(Request $request)
    {
    	$admin=Admin::where('user_id',$request->session()->get('loggedAdmin'))->get();
    	if ($admin) {
    		$schools=School::all();
    		return view('Admin.index')
    			->with('schools',$schools);
    	}else{
    		$request->session()->flash('message','Sorry You Need to Login First');
    	}
    }
    public function logout(Request $request)
    {
    	$request->session()->flush();
    	$request->session()->regenerate();
    	$request->session()->flash('message','Logout Successfull');
    	return redirect()->route('admin.login');
    }
}
