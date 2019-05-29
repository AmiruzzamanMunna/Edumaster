<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


//Admin Part


Route::get('/admin','AdminController@login')->name('admin.login'); 
Route::post('/admin','AdminloginController@adminLoginVerify')->name('admin.adminLoginVerify');

Route::get('/admin/index','AdminController@index')->name('admin.index'); 
Route::get('/logout','AdminController@logout')->name('admin.logout');
Route::post('/searchschool','AdminController@searchSchool')->name('admin.searchSchool');

Route::get('/admin/schoollist','AdminController@schoolList')->name('admin.schoolList');
Route::get('/admin/schoolform','AdminController@schoolForm')->name('admin.schoolForm');
Route::post('/admin/schoolform','AdminController@addSchool')->name('admin.addSchool');
Route::get('/admin/schooledit/{id}','AdminController@editSchool')->name('admin.editSchool');
Route::post('/admin/schooledit/{id}','AdminController@editSchoolAdd')->name('admin.editSchoolAdd');

Route::get('admin/deleteSchool','AdminController@deleteSchool')->name('admin.deleteSchool');

Route::get('/admin/userlist','AdminController@userlist')->name('admin.userlist');

Route::get('/admin/insert','AdminController@insertAdmin')->name('admin.insertAdmin');
Route::post('/admin/insert','AdminController@insertverify')->name('admin.insertverify');

Route::get('/admin/updateform/{id}','AdminController@editAdmin')->name('admin.editAdmin');
Route::post('/admin/updateform/{id}','AdminController@adminUpdate')->name('admin.adminUpdate');

Route::get('/admin/deleteadmin','AdminController@deleteAdmin')->name('admin.deleteAdmin');

Route::get('/admin/grouplist','AdminController@adminGroupList')->name('admin.adminGroupList');

Route::get('/admin/permission/{id}','AdminController@permissionListedit')->name('admin.permissionListedit');
Route::post('/admin/permission/{id}','AdminController@updatePermission')->name('admin.updatePermission');


