@extends('Layouts.Admin')
@section('title')
	DashBoard
@endsection
@section('container')
@if(Session::has('loggedAdmin'))
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
      </div>
      <h1>Dashboard</h1>
  	  <!-- <ul class="breadcrumb">
        <li><a href="http://localhost:8080/edumaster/index.php?route=common/dashboard&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Home</a></li>
        <li><a href="http://localhost:8080/edumaster/index.php?route=common/dashboard&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Dashboard</a></li>
	  </ul><br> -->
      <form method="post" action="{{route('admin.searchSchool')}}">
        {{csrf_field()}}
      <div class="row">
        <div class="col-md-2">
          <input type="text" name="searchname" placeholder="search school" class="form-control"></div>
      </div>
      </form>
    </div>
  </div>
  <div class="container-fluid">    
    <div class="row">
      @forelse($schools as $school)
      <div class="col-lg-4 col-md-4 col-sm-6">
        <div class="tile tile-primary">
          <div class="tile-heading">{{$school->school_name}}
            <span class="pull-right">0%</span>
          </div>
          <div class="tile-body">
            <h2 class="pull-right">{{$school->school_name}}</h2>
          </div>
        <div class="tile-footer">
          <a href="">View more...</a>
        </div>
      </div>
    </div>
    @empty
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="col-md-3">
              <h3>&nbsp;&nbsp;Sorry No School found</h3>
            </div>
          </div>
        </div>
      </div>
    @endforelse
  </div>  
  @if(session('message'))
    <div class="alert alert-success">
      {{session('message')}}
    </div>
  @endif
</div>

@endif
@endsection