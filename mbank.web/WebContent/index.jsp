
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session = "false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 

<title>Mbank System</title>
<link href="/style.css" rel="stylesheet" type="text/css">


<style>
.errMsg{
color:#FF0000;
font-weight: bold:

}
#login_table{
	border-spacing:10px;
	border:1px outset blue;
	border-radius:10px;
	box-shadow:2px 2px 4px darkgray;
}
</style>


<script>
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>


</head>

<body background="images/backgrounds4.jpg">
<br/><br/>
<h2>Welcome to Mbank system</h2><br>
<img src="images/Bank.png" name="home_img" border="0" id="home_img" style="height: 156px; width: 367px; "/>
<br/><br/>


<form action="login" method="get" onsubmit="return validateLogin()">
	<table id="login_table">
		<tr>
			<td colspan=2><h3>Sign In</h3></td>
		</tr>
		<tr>
			<td>Client ID:</td>
			<td><input type="text" name="client_id" id="client_id" required onkeypress="return isNumber(event)"/></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" id="passowrd" required/></td>
		</tr>
		<tr>
			<td colspan=2>
				<input name="submit" id="submit" type="submit" value=" Login"/>
			</td>
		</tr>
	</table>
</form>
<div class="errMsg">${errorMessage}</div>

</body>
</html>