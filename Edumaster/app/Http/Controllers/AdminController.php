<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Admin;
use App\AdminGroup;
use App\School;
use App\Feature;
use App\Permission;

class AdminController extends Controller
{
	
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
    	$admin=Admin::where('id',$request->session()->get('loggedAdmin'))->get();
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
    	$admin=Admin::where('id',$request->session()->get('loggedAdmin'));
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
    	$admin=Admin::where('id',$request->session()->get('loggedAdmin'))->get();
    	$searchname=$request->searchname;
    	if ($admin) {
    		$schools=School::where('school_name','like','%'.$searchname.'%')->get();
    		return view('Admin.index')
    				->with('schools',$schools);
    	}else{
    		$request->session()->flash('message','You have given a Wrong School Name');
    	}
    }
    public function userlist(Request $request)
    {
    	$admin=$request->session()->get('loggedAdmin');
    	if ($admin) {

    		$admins=Admin::all();
    		return view('Admin.adminuserlist')
    				->with('admins',$admins);
    		
    	}else{
    		$request->session()->flash('message','Sorry You Need to login First');
    		return redirect()->route('admin.login');
    	}
    }
    public function insertAdmin(Request $request)
	{
		$admin=$request->session()->get('loggedAdmin');
		if ($admin) {

			$admingroups=AdminGroup::all();
			return view('Admin.admininsert')
				->with('admingroups',$admingroups);
		}
		
	}
	public function insertverify(Request $request)
	{
		$request->validate([
    		'username'=>'required',
    		'user_group_id'=>'required',
    		'firstname'=>'required',
    		'lastname'=>'required',
    		'email'=>'required',
    		'password'=>'required',
    		'confirm'=>'required|same:password',
    		'status'=>'required',
    	]);
		$admin = new Admin();
		$admin->username=$request->username;
    	$admin->user_group_id=$request->user_group_id;
    	$admin->firstname=$request->firstname;
    	$admin->lastname=$request->lastname;
    	$admin->email=$request->email;
    	if ($request->hasFile('image')) {
          $image = $request->file('image');
          $filename = time() . 'admin-1.' . $image->getClientOriginalExtension();
          $location = public_path('images/uploads');
          $image->move($location, $filename);
          // Image::make($image)->resize(800, 400)->save($location);
          $admin->image = $filename;
        }
    	$admin->password=Hash::make($request->password);
    	$admin->status=$request->status;
    	$admin->save();
    	$request->session()->flash('message','Admin Update Successfully');
    	return redirect()->route('admin.userlist');

	}
    public function editAdmin(Request $request,$id)
    {
    	$admins=Admin::where('id',$id)->get();
    	$admingroups=AdminGroup::all();
    	return view('Admin.updateadminform')
    			->with('admins',$admins)
    			->with('admingroups',$admingroups);
    }
    public function adminUpdate(Request $request,$id)
    {
    	$request->validate([
    		'username'=>'required',
    		'user_group_id'=>'required',
    		'firstname'=>'required',
    		'lastname'=>'required',
    		'email'=>'required',
    		'password'=>'required',
    		'confirm'=>'required|same:password',
    		'status'=>'required',
    	]);
    	$admin=Admin::findorFail($request->id);
    	$admin->username=$request->username;
    	$admin->user_group_id=$request->user_group_id;
    	$admin->firstname=$request->firstname;
    	$admin->lastname=$request->lastname;
    	$admin->email=$request->email;
    	if ($request->hasFile('image')) {
          $image = $request->file('image');
          $filename = time() . 'admin-1.' . $image->getClientOriginalExtension();
          $location = public_path('images/uploads');
          $image->move($location, $filename);
          // Image::make($image)->resize(800, 400)->save($location);
          $admin->image = $filename;
        }
    	$admin->password=Hash::make($request->password);
    	$admin->status=$request->status;
    	$admin->save();
    	$request->session()->flash('message','Admin Update Successfully');
    	return redirect()->route('admin.userlist');
    }
    public function deleteAdmin(Request $request)
    {
    	$deletes=$request->selected;
    	foreach ($deletes as $delete) {
    		Admin::where('id',$delete)->delete();
    	}
    	$request->session()->flash('message','Deleted Successfully');
    	return redirect()->route('admin.userlist');
    }
    public function adminGroupList(Request $request)
    {
    	$admin=$request->session()->get('loggedAdmin');
    	if ($admin) {
    		$admingrouplist=AdminGroup::all();
    		return view('Admin.admingroup')
    				->with('admingrouplist',$admingrouplist);
    	}else{
    		$request->session()->flash('message','Sorry You Need to Login First');
    		return redirect()->route('admin.login');
    	}
    }
    public function permissionListedit(Request $request,$id)
    {
    	$admin=$request->session()->get('loggedAdmin');
    	if ($admin) {

    		$features=Feature::all();
    		$permission=Permission::where('user_group_id',$id)->get();
    		return view('Admin.adminpermission')
    				->with('permission',$permission)
    				->with('features',$features);
    	}else{

    		$request->session()->flash('message','Sorry You Need to Login First');
    		return redirect()->route('admin.login');
    	}
    }
    public function updatePermission(Request $request,$id)
    {
        $admin=$request->session()->get('loggedAdmin');
        $selected=$request->selected;
        $x=count($selected);
        if ($selected) {
            foreach ($selected as $select) {
                // print_r($select);
                for($i=0;$i<=$x;$i++){
                    DB::table('oc_permission')->where('user_group_id',$request->id)->update([
                    'user_group_id'=>$admin,
                    'user_id'=>$admin,
                    'feature_id'=>$select,
                    'status'=>1,  
                    ]);
                }       
            }
        }else{
           $request->session()->flash('message','Sorry You Did not Select anything');
            return redirect()->route('admin.adminGroupList');
        }
        $request->session()->flash('message','Data Modified');
        return redirect()->route('admin.adminGroupList');
    }
}
