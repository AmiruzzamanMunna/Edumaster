<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Admin;

class AdminloginController extends Controller
{
    public function adminLoginVerify(Request $request)
    {
    	$this->validate($request,[
    			'username'=>'required',
    			'password'=>'required',
    			'captchadata'=>'required',
    		]);
    	if ($request->captchadata1+$request->captchadata2==$request->captchadata) {
    		$admin=Admin::where('username',$request->username)->first();
    		if($admin && Hash::check($request->password,$admin->password)){
    			$request->session()->put('loggedAdmin',$admin->id);
       		 	$request->session()->flash('message','Login Successfull');
    			return redirect()->route('admin.index');
    		}else{

    			$request->session()->flash('message','Login UnSuccessfull');
            	return back();
    		}
    	}else{

    		$request->session()->flash('message','Sorry Login Error');
    		return back();
    	}
    }
}
