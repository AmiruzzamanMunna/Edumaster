@extends('layouts.Admin')
@section('title')
	Admin Group
@endsection
@section('container')
<div id="content">
  	<div class="page-header">
	    <div class="container-fluid">
	      	<div class="pull-right"><a href="http://localhost:8080/edumaster/index.php?route=user/user_permission/add&amp;user_token=I74ZFuBwxPGkfLyqiMrMo0KMSvWyx7rz" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add New"><i class="fa fa-plus"></i></a>
		        <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Are you sure?') ? $('#form-user-group').submit() : false;" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
	      	</div>
	      	<h1>User Groups</h1>
	      	<!-- <ul class="breadcrumb">
                <li>
                	<a href="http://localhost:8080/edumaster/index.php?route=common/dashboard&amp;user_token=I74ZFuBwxPGkfLyqiMrMo0KMSvWyx7rz">Home</a>
                </li>
                <li>
                	<a href="http://localhost:8080/edumaster/index.php?route=user/user_permission&amp;user_token=I74ZFuBwxPGkfLyqiMrMo0KMSvWyx7rz">User Groups</a>
                </li>
          	</ul> -->
	    </div>
  	</div>
  	<div class="container-fluid">
  		@if(session('message'))
			<div class="alert alert-success col-5">
				{{session('message')}}
			</div>
		@endif
	    <div class="panel panel-default">
	      	<div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-list"></i> User Group</h3>
	      	</div>
	      	<div class="panel-body">
		        <form action="http://localhost:8080/edumaster/index.php?route=user/user_permission/delete&amp;user_token=I74ZFuBwxPGkfLyqiMrMo0KMSvWyx7rz" method="post" enctype="multipart/form-data" id="form-user-group">
		          	<div class="table-responsive">
			            <table class="table table-bordered table-hover">
			              	<thead>
				                <tr>
				                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
				                  <td class="text-left">
				                  	<a href="" class="asc">User Group Name</a>
				                    </td>
				                  <td class="text-right">Action</td>
				                </tr>
			              	</thead>
			              	<tbody>
			              		@forelse($admingrouplist as $admingroup)
	                                <tr>
				                  		<td class="text-center"><input type="checkbox" name="selected[]" value="{{$admingroup->user_group_id}}"></td>
					                  	<td class="text-left">{{$admingroup->name}}</td>
					                  	<td class="text-right"><a href="{{route('admin.permissionListedit',$admingroup->user_group_id)}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
					                  	</td>
				                	</tr>
			                	@empty
			                	@endforelse
                     	 	</tbody>
			            </table>
		          	</div>
		        </form>
		        <div class="row">
		          <div class="col-sm-6 text-left"></div>
		          <div class="col-sm-6 text-right">Showing 1 to 3 of 3 (1 Pages)</div>
		        </div>
		      </div>
		    </div>
  </div>
</div>
@endsection