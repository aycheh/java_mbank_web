<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--link href="/style.css" rel="stylesheet" type="text/css"-->
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
                   <input type="hidden" value="${client_id}"/>
                  <div class="errMsg">${errorMessage}</div>
  </form>
<img src="images/Bank.png" name="home_img" border="0" id="home_img" style="height: 156px; width: 367px; "/>
	</div>
</div>


<div>
<table>
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
</div>



<table border="1">
 <tr>
     <form action="viewAccountDetails" method="get">
     	<th><input class="white_button" name="commit" type="submit" value="Get Account Details" required/></th>
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
     	<th><input class="white_button" name="commit" type="submit" value=" withdraw" /></th>
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
  



<table id="Client Details" border="1"> 
<tr>
        <th colspan="5" style="background-color:#7c2f97;">Client Details</th>
    <tr style="background-color:#f0a64e;">
<tr class="border"><td>client id: </td><td>${client_details.client_id}</td></tr>
<tr class="border"><td>client_name: </td><td>${client_details.client_name}</td></tr>
<tr class="border"><td>password: </td><td>${client_details.password}</td></td></tr>
<tr class="border"><td>email: </td><td>${client_details.email}</tr>
<tr class="border"><td>phone: </td><td>${client_details.phone}</td></tr>
<tr class="border"><td>Type: </td><td>${client_details.type}</td></tr>
<tr class="border"><td>comment: </td><td>${client_details.comment}</td></tr>
</tr>
</table> 


client_details.jsp
</body>
</html>