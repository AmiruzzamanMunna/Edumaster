@extends('Layouts.Admin')
@section('title')
	Admin Permission
@endsection
@section('container')
<div id="content">
  	<div class="page-header">
	    <div class="container-fluid">
	      	<div class="pull-right">
	      		<button type="submit" form="form-user" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i>
	      		</button>
	      	</div>
	      <h1>User Permission List</h1>
	      	<ul class="breadcrumb">
	                <!-- <li><a href="http://localhost:8080/edumaster/index.php?route=common/dashboard&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl">Home</a></li>
	                <li><a href="http://localhost:8080/edumaster/index.php?route=user/user&amp;user_token=EEnU5zwspUB19Lxa9aKIxy7y8CKhbvfl">Users</a></li> -->
          	</ul>
	    </div>
  	</div>
	<div class="container-fluid">
	    <div class="panel panel-default">
	      	<div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-list"></i>Group Name</h3>
	      	</div>
		  	<div class="panel-body">
		        <form action="" method="post" enctype="multipart/form-data" id="form-user">
		        	{{csrf_field()}}
		          	<div class="table-responsive">
			            <table class="table table-bordered table-hover">
			              	<thead>
				                <tr>
				                  <!-- <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td> -->
				                  <td class="text-left"><a href="" class="">Feature Name</a></td>
				                  <td class="text-left"><a href="">Dispaly</a></td>
				                </tr>
			              	</thead>
		              		<tbody>
		              			@forelse($features as $feature)
			                    <tr>
			                 	 	<td class="text-left">{{$feature->featurename}}</td>
			                 	 	<td class="text-center"><input type="checkbox" name="selected[]" value="{{$feature->id}}"></td>
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
</div>
@endsection