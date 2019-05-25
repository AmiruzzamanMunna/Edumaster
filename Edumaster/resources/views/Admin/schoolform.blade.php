@extends('Layouts.Admin')
@section('title')
	School Form
@endsection
@section('container')
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" href=""  form="form-user" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i></button>
        <a href="" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Cancel"><i class="fa fa-reply"></i></a></div>
      <h1>School Information</h1>
      <ul class="breadcrumb">
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> </h3>
      </div>
      <div class="panel-body">
        <form action="" method="post" enctype="multipart/form-data" id="form-user" class="form-horizontal">
          {{csrf_field()}}
  
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">School Code</label>
            <div class="col-sm-10">
              <input type="text" name="school_code" placeholder="school code" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">School Name</label>
            <div class="col-sm-10">
              <input type="text" name="school_name" placeholder="school name" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">Location</label>
            <div class="col-sm-10">
              <input type="text" name="location" placeholder="location" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">Total Student</label>
            <div class="col-sm-10">
              <input type="text" name="total_student" placeholder="total student" id="input-username" class="form-control">
                <div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">School Account</label>
            <div class="col-sm-10">
              <input type="text" name="school_account" placeholder="school account" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">School Account Type</label>
            <div class="col-sm-10">
              <input type="text" name="school_account_type" placeholder="school account type" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>
          <div class="form-group required has-error">
            <label class="col-sm-2 control-label" for="input-username">Academic Session</label>
            <div class="col-sm-10">
              <input type="text" name="academic_session" placeholder="accademic session" id="input-username" class="form-control">
            	<div class="text-danger"></div>
          	</div>
          </div>

      	</form>
        @if($errors->any())
          <ul>
            @foreach($errors->all() as $error)
              <li>{{$error}}</li>
            @endforeach
          </ul>
        @endif
        @if(session('message'))
          <div class="alert alert-success col-5">
            {{session('message')}}
          </div>
        @endif
  	  </div>  
    </div>
  </div>
</div>
@endsection