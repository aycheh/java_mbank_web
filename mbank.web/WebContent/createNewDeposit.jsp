<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title> Mbank System </title>

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

     	<form action="withdraw.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" withdraw" /></th>
     	</form>

     <form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" get Details" /></th>
     </form>
      <form action="updateClientDetails.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" updateClientDetails" /></th>
     </form>
     <form action="ViewActivity" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" View your Activity" /></th>
     	</form>
     
     <form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
     </form>
     
     </tr>     
 </table>
 
 <div>${successful_deposit_message}</dir>
 
 <table id="account details" border="1"> 
<tr>
        <th colspan="5" style="background-color:#7c2f97;">Client details</th>
    <tr style="background-color:#f0a64e;">
<tr class="border"><td>client id: </td><td>${deposit_details.client_id}</td></tr>
<tr class="border"><td>balance: </td><td>${deposit_details.balance}</td></tr>
<tr class="border"><td>type: </td><td>${deposit_details.type}</td></td></tr>
<tr class="border"><td>estimated_balance: </td><td>${deposit_details.estimated_balance}</tr>
<tr class="border"><td>opening_date: </td><td>${deposit_details.opening_date}</td></tr>
<tr class="border"><td>closing_date: </td><td>${deposit_details.closing_date}</td></tr>

</tr>
</table>

<form action="Deposit" method="get">
	<table id="Deposit">
		<tr>
			<td colspan=2><h4>please fill your deposit details </h4></td>
		</tr>
		<tr>
			<td>amount:</td>
			<td><input type="text" name="amount" id="amount" required onkeypress="return isNumber(event)"/></td>
		</tr>
				<tr>
			<td>opening date:</td>
			<td><input type="text" name="opening_date" id="opening_date" required/></td>
		</tr>
				<tr>
			<td>closing date:</td>
			<td><input type="text" name="closing_date" id="closing_date" required/></td>
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
	<div class="errMsg">${error_deposit}</div>
	
	


create new deposit.jsp






</body>
</html>