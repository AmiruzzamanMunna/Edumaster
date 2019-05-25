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
    public function schoolList(Request $request)
    {
    	$admin=Admin::where('user_id',$request->session()->get('loggedAdmin'));
    	if ($admin) {
    		$schools=School::all();
    		$school_id=0;
    		foreach ($schools as $school) {
    			$school_id=$school->id;

    		}
    		return view('Admin.schoollist')
    				->with('school_id',$school_id)
    				->with('schools',$schools);
    	}
    }
    public function schoolForm(Request $request)
    {
    	$schools=School::all();
    	return view('Admin.schoolform')
    			->with('schools',$schools);
    }
    public function addSchool(Request $request)
    {
    	$request->validate([

    		'school_code'=>'required',
    		'school_name'=>'required',
    		'location'=>'required',
    		'total_student'=>'required',
    		'school_account'=>'required',
    		'school_account_type'=>'required',
    		'academic_session'=>'required',
    	]);
    	$school=new School();
    	$school->school_code=$request->school_code;
    	$school->school_name=$request->school_name;
    	$school->location=$request->location;
    	$school->total_student=$request->total_student;
    	$school->school_account=$request->school_account;
    	$school->school_account_type=$request->school_account_type;
    	$school->academic_session=$request->academic_session;
    	$school->save();
    	$request->session()->flash('message','Data Inserted Successfully');
    	return back();
    }
    public function editSchool(Request $request,$id)
    {
    	$schools=School::where('id',$id)->get();
    	return view('Admin.updateschool')
    			->with('schools',$schools);
    }
    public function editSchoolAdd(request $request,$id)
    {
    	$school=School::find($request->id);
    	$request->validate([

    		'school_code'=>'required',
    		'school_name'=>'required',
    		'location'=>'required',
    		'total_student'=>'required',
    		'school_account'=>'required',
    		'school_account_type'=>'required',
    		'academic_session'=>'required',
    	]);
    	$school->school_code=$request->school_code;
    	$school->school_name=$request->school_name;
    	$school->location=$request->location;
    	$school->total_student=$request->total_student;
    	$school->school_account=$request->school_account;
    	$school->school_account_type=$request->school_account_type;
    	$school->academic_session=$request->academic_session;
    	$school->save();
    	$request->session()->flash('message','Data Update Successfully');
    	return redirect()->route('admin.schoolList');

    }
    public function deleteSchool(Request $request)
    {
    	$delschool=$request->selected;
    	foreach ($delschool as $del) {
    		$schools=School::where('id',$del)->delete();
    	}
    	
    	$request->session()->flash('message','Data Deleted Successfully');
    	return redirect()->route('admin.schoolList');
    }
    public function searchSchool(Request $request)
    {
    	$admin=Admin::where('user_id',$request->session()->get('loggedAdmin'))->get();
    	$searchname=$request->searchname;
    	if ($admin) {
    		$schools=School::where('school_name','like','%'.$searchname.'%')->get();
    		return view('Admin.index')
    				->with('schools',$schools);
    	}else{
    		$request->session()->flash('message','You have given a Wrong School Name');
    	}
    }
}
