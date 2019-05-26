@extends('Layouts.Admin')
@section('title')
	Users 
@endsection
@section('container')
<div id="content">
	<form action="{{route('admin.deleteAdmin')}}" method="" enctype="multipart/form-data" id="form-user">
	  	<div class="page-header">
		    <div class="container-fluid">
		      	<div class="pull-right"><a href="{{route('admin.insertAdmin')}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title=""><i class="fa fa-plus"></i></a>
			        <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-user').submit() : false;" data-original-title=""><i class="fa fa-trash-o"></i></button>
		      	</div>
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
			        <h3 class="panel-title"><i class="fa fa-list"></i> User List</h3>
		      	</div>
			  	<div class="panel-body">
			        <form action="" method="post" enctype="multipart/form-data" id="form-user">
			          	<div class="table-responsive">
				            <table class="table table-bordered table-hover">
				              	<thead>
					                <tr>
					                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
					                  <td class="text-left">                    <a href="http://localhost:8080/edumaster/index.php?route=user/user&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl&amp;sort=username&amp;order=DESC" class="asc">Username</a>
					                    </td>
					                  <td class="text-left">                    <a href="http://localhost:8080/edumaster/index.php?route=user/user&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl&amp;sort=status&amp;order=DESC">Status</a>
					                    </td>
					                  <td class="text-left">                    <a href="http://localhost:8080/edumaster/index.php?route=user/user&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl&amp;sort=date_added&amp;order=DESC">Date Added</a>
					                    </td>
					                  <td class="text-right">Action</td>
					                </tr>
				              	</thead>
			              		<tbody>
			              			@forelse($admins as $admin)
				                    <tr>
				                  		<td class="text-center">
					                  		<input type="checkbox" name="selected[]" value="{{$admin->id}}">
				                    	</td>
				                 	 	<td class="text-left">{{$admin->username}}</td>
					                  	<td class="text-left">
					                  		@if($admin->status==1)
					                  			Enabled
					                  		@else
					                  			Disabled
					                  		@endif
					                  	</td>
					                  	<td class="text-left">{{$admin->date_added}}</td>
					                  	<td class="text-right"><a href="{{route('admin.editAdmin',$admin->id)}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a></td>
					                </tr>
					                @empty
					                @endforelse
			                  	</tbody>
			            	</table>	
			          	</div>
				        <div class="row">
				          <div class="col-sm-6 text-left"></div>
				          <div class="col-sm-6 text-right">Showing 1 to 3 of 3 (1 Pages)</div>
				        </div>
			      	</form>
		    	</div>
		  	</div>
		</div>
 	</form>
</div>
@endsection