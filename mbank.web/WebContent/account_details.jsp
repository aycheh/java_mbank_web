<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                   <div>${client_id}</div>
                  <div class="errMsg">${errorMessage}</div>
  </form>
  
  

<img src="images/Bank.png" name="home_img" border="0" id="home_img" style="height: 156px; width: 367px; "/>
	</div>
</div>



<div style="height: 208px; ">
<table border="0"  bgcolor="#E5E4E2">
<tr>
  <td>
    <form action="ClientAction" method="get">   
				${client_idgetAttribute}
             <p style="clear:both">                 
              <div class="errMsg">   </div>
              				
    </form>
 </td>
</tr>
</table>


<tr>
<table border="1">
 <tr>
     <tr>
     	<form action="getClientBalance.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" getClientBalance" /></th>
     	</form>
     	 <form action="PreOpenDeposit.jsp" method="get">    	
     	<th><input class="white_button" name="commit" type="submit" value=" preOpenDeposit" /> </th>
     	</form>
     	<th><input class="white_button" name="commit" type="submit" value=" viewAllDiposits" /></th>
     
     	<form action="depositInToAccountjsp.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" depositInToAccount" /></th>
     	</form>
     	
     	<form action="createNewDeposit.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" createNewDeposit" /></th>
     	</form>
     	
     	 <form action="Withdraw" method="get">
     	<th>amount : <input type="text" name="amount" size="8" required/>     	
     	<th><input class="white_button" name="commit" type="submit" value="withdraw" required/></th>
     	</form>
     	
     	<form action="ViewActivity" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" View your Activity" /></th>
     	</form>
     	
     <form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" get Details" /></th>
     </form>
     
     <form action="viewAccountDetails" method="get">
     	Account ID: <input type="text" name="account_id" size="8" />
     	<th><input class="white_button" name="commit" type="submit" value=" viewAccountDetails" /></th>
     </form>
       
     <form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
     </form>
     
     </tr>     
 </table>
  
</div>


<div>
<table id="clientdetails">  
<tr><td>client_id: </td><td> ${client_details.client_id}</td></tr>
<tr><td>client_name: </td><td>${client_details.client_name}</td></tr>
<tr><td>password: </td><td>${client_details.password}</td></tr>
<tr><td>address: </td><td>${client_details.address}</td></tr>
<tr><td>email: </td><td>${client_details.email}</td></tr>
<tr><td>phone: </td><td>${client_details.phone}</td></tr>
<tr><td>comment: </td><td>${client_details.comment}</td></tr>
</table> 
</div>


account_details.jsp



</body>
</html>