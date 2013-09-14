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
     
     <form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Client details" /></th>
     </form>

     	 <form action="PreOpenDeposit.jsp" method="get">    	
     	<th><input class="white_button" name="commit" type="submit" value=" preOpenDeposit" /> </th>
     	</form>

     	
      <form action="ClientAllDeposits" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" viewAllDiposits" /></th>
     </form>    	
     	<form action="depositInToAccountjsp.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" depositInToAccount" /></th>
     	</form>
     	
     	<form action="createNewDeposit.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" create New Deposit" /></th>
     	</form>
     	
     	 <form action="withdraw.jsp" method="get">	     	
     	<th><input class="white_button" name="commit" type="submit" value="withdraw" required/></th>
     	</form>
     	
     	<form action="ViewActivity" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" View your Activity" /></th>
     	</form>
     	
     
     	<form action="updateClientDetails.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" updateClientDetails" /></th>
     </form>
     	
     	<form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
    	</form>
     </tr>     
 </table>


<div>
<table id="account details" border="1"> 
   <th colspan="5" style="background-color:#7c2f97;">account details</th>
<tr class="border"><td>account_id: </td><td>${account.account_id}</td></tr>
<tr class="border"><td>client_id: </td><td>${account.client_id}</td></tr>
<tr class="border"><td>balance: </td><td>${account.balance}</td></td></tr>
<tr class="border"><td>credit_limit: </td><td>${account.credit_limit}</tr>
<tr class="border"><td>comment: </td><td>${account.comment}</td></tr>
</table> 
</div>


</body>
</html>