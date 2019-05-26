@extends('Layouts.Admin')
@section('title')
	Update Admin Form
@endsection
@section('container')
<div id="content">
  	<div class="page-header">
	    <div class="container-fluid">
	     	 <div class="pull-right">
		        <button type="submit" form="form-user" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i></button>
		        <a href="" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Cancel"><i class="fa fa-reply"></i></a></div>
		      	<h1>Users</h1>
		      	<ul class="breadcrumb">
		            <!-- <li><a href="http://localhost:8080/edumaster/index.php?route=common/dashboard&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl">Home</a></li>
		            <li><a href="http://localhost:8080/edumaster/index.php?route=user/user&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl">Users</a></li> -->
		 		</ul>
	    	</div>
	 	</div>
	  	<div class="container-fluid">
		    <div class="panel panel-default">
		      <div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit User</h3>
		      </div>
		      <div class="panel-body">
		        <form action="" method="post" enctype="multipart/form-data" id="form-user" class="form-horizontal">
		        	{{csrf_field()}}
		        	@forelse($admins as $admin)
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-username">Username</label>
				            <div class="col-sm-10">
				              <input type="text" name="username" value="{{$admin->username}}" placeholder="Username" id="input-username" class="form-control">
			          		</div>
			          	</div>
			          	<div class="form-group">
				            <label class="col-sm-2 control-label" for="input-user-group">User Group</label>
				            <div class="col-sm-10">
				              	<select name="user_group_id" id="input-user-group" class="form-control">
				              		@foreach($admingroups as $admingroup)
					                	<option value="{{$admingroup->user_group_id}}">{{$admingroup->name}}</option>
					                @endforeach
				              	</select>	
				            </div>
			          	</div>
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-firstname">First Name</label>
				            <div class="col-sm-10">
				              <input type="text" name="firstname" value="{{$admin->firstname}}" placeholder="First Name" id="input-firstname" class="form-control">
				          	</div>
			          	</div>
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-lastname">Last Name</label>
				            <div class="col-sm-10">
				              <input type="text" name="lastname" value="{{$admin->lastname}}" placeholder="Last Name" id="input-lastname" class="form-control">
				          	</div>
			          	</div>
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
				            <div class="col-sm-10">
				              <input type="text" name="email" value="{{$admin->email}}" placeholder="E-Mail" id="input-email" class="form-control">
				          	</div>
			          	</div>
			          	<div class="form-group">
				            <label class="col-sm-2 control-label" for="input-image">Image</label>
				            <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail" data-original-title="" title="" aria-describedby="popover694935"><img src="http://localhost:8080/edumaster/image/cache/no_image-100x100.png" alt="" title="" data-placeholder="http://localhost:8080/edumaster/image/cache/no_image-100x100.png"></a><div class="popover fade right in" role="tooltip" id="popover694935" style="top: 26px; left: 125px; display: block;"><div class="arrow" style="top: 50%;"></div><h3 class="popover-title" style="display: none;"></h3><div class="popover-content"><button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button></div></div>
				              <input type="file" name="image" value="" id="input-image">
				            </div>
			          	</div>
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-password">Password</label>
				            <div class="col-sm-10">
				              <input type="password" name="password" value="{{$admin->password}}" placeholder="Password" id="input-password" class="form-control" autocomplete="off">
				          	</div>
			          	</div>
			          	<div class="form-group required">
				            <label class="col-sm-2 control-label" for="input-confirm">Confirm</label>
				            <div class="col-sm-10">
				              <input type="password" name="confirm" value="" placeholder="Confirm" id="input-confirm" class="form-control">
				          	</div>
			          	</div>
			          	<div class="form-group">
				            <label class="col-sm-2 control-label" for="input-status">Status</label>
				            <div class="col-sm-10">
				              	<select name="status" id="input-status" class="form-control">
					                <option value="0">Disabled</option>
					                <option value="1" selected="selected">Enabled</option>
				              	</select>
				            </div>
			          	</div>
			        @empty
			        <h1>no value</h1>
		          	@endforelse
		        </form>
		        @if($errors->any())
		        <ul>
		        	@foreach($errors->all() as $error)
		        		<li>{{$error}}</li>
		        	@endforeach
		        </ul>
		        @endif
		      </div>
		    </div>
		</div>
 	</div>
</div>
@endsection