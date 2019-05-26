@extends('Layouts.Admin')
@section('title')
	School List
@endsection
@section('container')
<div id="content">
	<div class="row">
      	@if(session('message'))
          <div class="alert alert-success col-3">
            {{session('message')}}
          </div>
        @endif
    </div>
	<form action="{{route('admin.deleteSchool')}}" enctype="multipart/form-data" id="form-user">
    	{{csrf_field()}}
	  	<div class="page-header">
		    <div class="container-fluid">
		      <div class="pull-right"><a href="{{route('admin.schoolForm')}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title=""><i class="fa fa-plus"></i></a>
		        <button type="submit" data-toggle="tooltip" title="" class="btn btn-danger"><a href="{{route('admin.deleteSchool')}}"><i class="fa fa-trash-o"></i></a>
		        </button>
		      </div>
		      <h1>School Information</h1>
		      <ul class="breadcrumb">
		      </ul>
		    </div>
		  	<div class="container-fluid">
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h3 class="panel-title"><i class="fa fa-list"></i> All School List</h3>
			      </div>
			      <div class="panel-body">
			          <div class="table-responsive">
			            <table class="table table-bordered table-hover">
			              <thead>
			                <tr>
			                  <td style="width: 1px;" class="text-center">
			                  	<input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Code</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Name</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Location</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Total Student</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Account</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">School Account Type</a>
			                  </td>
			                  <td class="text-left">
			                  	<a href="">Academic Session</a>
			                  </td>
			                  <td class="text-right">Action</td>
			                </tr>
			              </thead>
			              <tbody>

			              	@forelse($schools as $school)
			            	<tr>
			                  <td class="text-center">
			                  	<input type="checkbox" name="selected[]" value="{{$school->id}}">
			                  </td>
			                  <td class="text-left">{{$school->school_code}}</td>
			                  <td class="text-left">{{$school->school_name}}</td>
			                  <td class="text-left">{{$school->location}}</td>
			                  <td class="text-left">{{$school->total_student}}</td>
			                  <td class="text-left">{{$school->school_account}}</td>
			                  <td class="text-left">{{$school->school_account_type}}</td>
			                  <td class="text-left">{{$school->academic_session}}</td>
			                  <td class="text-right"><a href="{{route('admin.editSchool',$school->id)}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a></td>
			                </tr>
			                @empty
			                @endforelse
			              </tbody>
			            </table>
			          </div>
			      </div>
			 	</div>
      		</div>
      	</div>
    </form>
    
</div>
@endsection