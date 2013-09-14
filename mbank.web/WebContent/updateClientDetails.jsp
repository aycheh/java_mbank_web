<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Mbank System </title>
<style>

.errMsg{
color:#FF0000;
font-weight: bold:

}
</style>

</head>
<h1> ${welcaomeMsg}</h1>

<body background="images/backgrounds4.jpg">
<div id="home_left_col">
	<div id="home_main_box">	
	<form action="Logout" method="get">
     <p style="clear:both">
                  <input class="white_button" name="commit" type="submit" value="Logout" />
                   Welcome :  ${Client_nameAttribute}              
                  <div class="errMsg">${errorMessage}</div>
  </form>
<img src="images/Bank.png" name="home_img" border="0" id="home_img" style="height: 156px; width: 367px; "/>
	</div>
</div>

<table border="1">    
 <tr>
     <tr>
     <form action="viewAccountDetails" method="get">
     	<th><input class="white_button" name="commit" type="submit" value="Get Account Details" /></th>
     	</form>

     	 <form action="PreOpenDeposit.jsp" method="get">    	
     	<th><input class="white_button" name="commit" type="submit" value=" preOpenDeposit" /> </th>
     	</form>
     	
     	<form action="ClientAllDeposits" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" view Your Diposits" /></th>
     	</form>
     	
     	<form action="depositInToAccountjsp.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" depositInToAccount" /></th>
     	</form>
     	
     	<form action="createNewDeposit.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" create New Deposit" /></th>
     	</form>
     	
     	<form action="withdraw.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" withdraw" /></th>
     	</form>

     <form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" get Details" /></th>
     </form>
     
     <form action="ViewActivity" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" View your Activity" /></th>
     	</form>
     	
       
     <form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
     </form>
     
     </tr>     
 </table>
 
 <div>${successful_client_update_message}</dir>
 
 <table id="account details" border="1"> 
<tr>
        <th colspan="5" style="background-color:#7c2f97;">Client details</th>
    <tr style="background-color:#f0a64e;">
<tr class="border"><td>client id: </td><td>${client_details.client_id}</td></tr>
<tr class="border"><td>client_name: </td><td>${client_details.client_name}</td></tr>
<tr class="border"><td>password: </td><td>${client_details.password}</td></td></tr>
<tr class="border"><td>email: </td><td>${client_details.email}</tr>
<tr class="border"><td>phone: </td><td>${client_details.phone}</td></tr>
<tr class="border"><td>address: </td><td>${client_details.address}</td></tr>
<tr class="border"><td>comment: </td><td>${client_details.comment}</td></tr>
</tr>
</table> 

 
 
<form action="UpdateClientDetails" method="get" onsubmit="return validateLogin()">
	<table id="update_client_details_table">
		<tr>
			<td colspan=2><h4>please fill your details </h4></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td><input type="text" name="Address" id="Address" required/></td>
		</tr>
				<tr>
			<td>Email:</td>
			<td><input type="text" name="Email" id="Email" required/></td>
		</tr>
				<tr>
			<td>Phone:</td>
			<td><input type="text" name="Phone" id="Phone" required/></td>
		</tr>
				
		<tr>
			<td>Old Password:</td>
			<td><input type="password" name="old_Password" id="old_Password" required/></td>
		</tr>
		<tr>
		<tr>
			<td>New Password:</td>
			<td><input type="password" name="New_Password" id="New_Password" required/></td>
		</tr>
				<tr>
			<td>Comment:</td>
			<td><input type="text" name="Comment" id="Comment"/></td>
		</tr>
		<tr>
			<td colspan=2>
				<input name="submit" id="submit" type="submit" value=" submit"/>				
			</td>
		</tr>
		
	</table>
	
</form>
		<form action=dashboard.jsp method="get">
		<table>
		<tr>
			<td colspan=2>
				<input type="submit" name="submitted" value="cancel">				
			</td>
		</tr>
		</table>
	</form>
	<div class="errMsg">${Error_UpdateClientDetails}</div>
	
	


update_client_details.jsp






</body>
</html>