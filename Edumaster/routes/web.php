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
Route::get('/admin/insert','AdminController@insertAdmin');
Route::post('/admin/insert','AdminController@insertverify');
Route::get('/admin/login','AdminController@login')->name('admin.login'); 
Route::post('/admin/login','AdminloginController@adminLoginVerify')->name('admin.adminLoginVerify'); 
Route::get('/admin','AdminController@index')->name('admin.index'); 
Route::get('/logout','AdminController@logout')->name('admin.logout');
