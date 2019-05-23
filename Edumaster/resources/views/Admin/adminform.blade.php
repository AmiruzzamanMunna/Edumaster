<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<form method="post">
	{{csrf_field()}}
	<input type="text" name="user_group_id" placeholder="user_group_id" value="1">
<input type="text" name="username" placeholder="username" placeholder="username">
<input type="text" name="password" placeholder="password" placeholder="password">
<input type="text" name="salt" placeholder="salt">
<input type="text" name="firstname" placeholder="firstname">
<input type="text" name="lastname" placeholder="last name">
<input type="text" name="email" placeholder="email">
<input type="text" name="image">
<input type="text" name="code">
<input type="text" name="ip" placeholder="ip">
<input type="text" name="status" value="1">
<input type="text" name="date_added" value="2019-04-30 17:30:28">
<input type="submit" name="" value="Submit">
</form>
</body>
</html>