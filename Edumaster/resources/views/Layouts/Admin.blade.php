
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>@yield('title')</title>
<base href="http://localhost:8080/edumaster/" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
@yield('script')

@yield('css')
<!-- bootstrap -->
<script type="text/javascript" src="{{asset('js')}}/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="{{asset('js')}}/javascript/bootstrap/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- end -->
<link href="{{asset('css')}}/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="{{asset('js')}}/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="{{asset('js')}}/javascript/jquery/datetimepicker/moment/moment.min.js" type="text/javascript"></script>
<script src="{{asset('js')}}/javascript/jquery/datetimepicker/moment/moment-with-locales.min.js" type="text/javascript"></script>
<script src="{{asset('js')}}/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="{{asset('js')}}/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="{{asset('css')}}/stylesheet.css" rel="stylesheet" media="screen" />
<script src="{{asset('js')}}/javascript/common.js" type="text/javascript"></script>
</head>
<body>
<div id="container">
@if(Session::has('loggedAdmin'))
<header id="header" class="navbar navbar-static-top">
  <div class="container-fluid">

  
    <div id="header-logo" class="navbar-header"><a href="{{route('admin.index')}}" class="navbar-brand"><img src="{{asset('images')}}/Edumaster_resized.png" id="logoimage" alt="OpenCart" title="OpenCart" /></a></div>
    <a href="#" id="button-menu" class="hidden-md hidden-lg"><span class="fa fa-bars"></span></a>    
    

    
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="{{asset('images')}}/profile-45x45.png" alt="Hishab Super" title="hishab" id="user-profile" class="img-circle" />Hishab Super <i class="fa fa-caret-down fa-fw"></i></a>
        <ul class="dropdown-menu dropdown-menu-right">
          <li><a href="http://localhost:8080/edumaster/index.php?route=common/profile&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159"><i class="fa fa-user-circle-o fa-fw"></i> Your Profile</a></li>
          <li role="separator" class="divider"></li>
          <li class="dropdown-header">Stores</li>
          <li><a href="http://localhost:8080/edumaster/" target="_blank">Hishab</a></li>
          <li><a href="http://localhost:81/hishabone" target="_blank">Hishab One</a></li>
        </ul>
      </li>
      <li><a href="{{route('admin.logout')}}"><i class="fa fa-sign-out"></i> <span class="hidden-xs hidden-sm hidden-md">Logout</span></a></li>
    </ul>
     </div>
</header>
<nav id="column-left">
  <div id="navigation"><span class="fa fa-bars"></span> Navigation</div>
    <ul id="menu">
      <li id="menu-dashboard"><a href="{{route('admin.index')}}"><i class="fa fa-dashboard fw"></i> Dashboard</a>        
      </li>
      <li id="menu-dashboard"> 
        <a href="#collapse1" data-toggle="collapse" class="parent collapsed"><i class="fa fa-cog fw"></i> School</a>
        <ul id="collapse1" class="collapse">
          <li>
            <a href="{{route('admin.schoolList')}}"><i class="fa fa-dashboard fw"></i> School</a> 
          </li>
        </ul>       
      </li>
      <!-- <li id="menu-extension">
        <a href="#collapse1" data-toggle="collapse" class="parent collapsed"><i class="fa fa-puzzle-piece fw"></i> Extensions</a>
        <ul id="collapse1" class="collapse">
          <li>    
            <a href="http://localhost:8080/edumaster/index.php?route=marketplace/marketplace&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Marketplace</a>
          </li>
          <li>
            <a href="http://localhost:8080/edumaster/index.php?route=marketplace/installer&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Installer</a>
          </li>
          <li>         
            <a href="http://localhost:8080/edumaster/index.php?route=marketplace/extension&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Extensions</a>
          </li>
          <li>
            <a href="http://localhost:8080/edumaster/index.php?route=marketplace/modification&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Modifications</a>
          </li>
          <li>
            <a href="http://localhost:8080/edumaster/index.php?route=marketplace/event&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Events</a>
          </li> 
        </ul>
      </li> -->
      <li id="menu-system">
        <a href="#collapse2" data-toggle="collapse" class="parent collapsed"><i class="fa fa-cog fw"></i> System</a> 
        <ul id="collapse2" class="collapse">
          <li> 
            <a href="http://localhost:8080/edumaster/index.php?route=setting/store&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Settings</a>
          </li>
          <li>
            <a href="#collapse2-1" data-toggle="collapse" class="parent collapsed">Users</a>
            <ul id="collapse2-1" class="collapse">
              <li>
                <a href="{{route('admin.userlist')}}">Users</a>
              </li>
              <li>
                <a href="{{route('admin.adminGroupList')}}">User Groups</a>
              </li>
              <li>
                <a href="">API</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#collapse2-2" data-toggle="collapse" class="parent collapsed">Maintenance</a>
            <ul id="collapse2-2" class="collapse">
              <li>
                <a href="http://localhost:8080/edumaster/index.php?route=tool/backup&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Backup / Restore</a>
              </li>
              <li>
                <a href="http://localhost:8080/edumaster/index.php?route=tool/upload&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Uploads</a>
              </li>
              <li>
                <a href="http://localhost:8080/edumaster/index.php?route=tool/log&amp;user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159">Error Logs</a>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <li id="menu-report">
        <a href="#collapse3" data-toggle="collapse" class="parent collapsed"><i class="fa fa-bar-chart-o fw"></i> Reports</a>        
      </li>
    </ul>
</nav>
@endif

@yield('container')

    

</div>
<footer id="footer"><a href="http://www.onelimitedbd.com">ONE</a> &copy; 2019-2029 All Rights Reserved.<br />Version 1.0.1.1</footer></div>
</body>

<script type="text/javascript"><!--
$('#button-setting').on('click', function() {
  $.ajax({
    url: 'index.php?route=common/developer&user_token=pfcUl2bkbhkNG1D1DDoBnl9KGeBKN159',
    dataType: 'html',
    beforeSend: function() {
      $('#button-setting').button('loading');
    },
    complete: function() {
      $('#button-setting').button('reset');
    },
    success: function(html) {
      $('#modal-developer').remove();
      
      $('body').prepend('<div id="modal-developer" class="modal">' + html + '</div>');
      
      $('#modal-developer').modal('show');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
}); 
</script> 
</html>
