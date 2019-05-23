
<!DOCTYPE html>
<html>
<head>
  	<title>Admin Login</title>
 	 <meta charset="utf-8">
 	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 <link rel="stylesheet" type="text/css" href="{{asset('css')}}/stylesheet.css">
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</style>
</head>
<body id="loginpage">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-12">
				<div class="row">
					<div class="col-md-8 ml-auto" id="loginpanle">
						<div class="row">
							<div class="col-10 m-auto">
								<img class="img-responsive" src="{{asset('images')}}/Edumaster.png" id="loginimage">
							</div>
						</div>
						@if(session('message'))
						<div class="alert alert-success col-5">
							{{session('message')}}
						</div>
						@endif
						<div class="panel panel-default col-md-5" id="panelbody">
							<form action="" method="post" enctype="multipart/form-data" id="formcontain">
								{{csrf_field()}}
								<div class="form-group col-10 m-auto">
				                	<label for="input-username" id="labelid">Username</label>
				               		<div class="input-group inputWithIcon">
				               			<span class="input-group-addon m-auto"><i class="fas fa-user-circle fa-2x iconcolor" aria-hidden="true"></i></span>
				                  		<input type="text" name="username" value="" placeholder="Username" id="input-username" class="form-control" />
				                  		
				               		</div>
				              	</div><br>
				              	<div class="form-group col-10 m-auto">
				                	<label for="input-password" id="labelid">Password</label>
				                	<div class="input-group inputWithIcon"><span class="input-group-addon m-auto"><i class="fa fa-key fa-2x iconcolor"></i></span>
				                  		<input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control" />
				                  		
				                	</div>

                					<span class="help-block"><a href=""></a></span>	
              					</div><br>
              					<div class="row">
              						<div class="col-7 m-auto">
              							<div class="row">
              								<div class="col-9 m-auto">
              									<label id="labelid">{{$data1}}</label><label id="labelid">+</label>

              								<label id="labelid">{{$data2}}</label><label id="labelid">=</label><input type="text" name="captchadata" class="col-5">
                                <input type="hidden" name="captchadata1" value="{{$data1}}">
                                <input type="hidden" name="captchadata2" value="{{$data2}}">
              								</div>
              							</div>
              						</div><br><br>
			                		<div class="col-4">
			                	
			                			<input type="submit" id="buttonid" class="btn btn-default col-7" name="" value="Login">
			              			</div>
			              		</div>
			              		<div class="row">
			              			<div class="col-4 m-auto">
			              				<label class="radio-inline" id="labelid"><input type="radio" name="optradio">Remember Me</label>
			              			</div>
			              			<div class="col-5 ml-auto">
										<a href="http://localhost:8080/edumaster/index.php?route=common/forgotten" id="labelid">Forgotten Password?</a>
											                			
			              			</div>
			              			@if($errors->any())
										<ul>
											@foreach($errors->all() as $error)
												<li>{{$error}}</li>
											@endforeach
										</ul>
									@endif
			              		</div>
              					<input type="hidden" name="redirect" value="" />
						        
                            <input type="hidden" name="redirect" value="http://localhost:8080/edumaster/index.php?route=common/login" />
                          </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<footer id="footer"><a href="http://www.onelimitedbd.com">ONE</a> &copy; 20019-2019 All Rights Reserved.<br /></footer></div>
</body></html>
