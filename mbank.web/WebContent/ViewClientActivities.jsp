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



<div style="height: 208px; ">
<table border="0"  bgcolor="#E5E4E2">
    <form action="ClientAction" method="get">   
			${client_idgetAttribute}
             <p style="clear:both">                 
              <div class="errMsg">   </div>              				
    </form>
</table>



    
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
     	
     	
     	
     	<form action="updateClientDetails.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" updateClientDetails" /></th>
     </form>
     
     <form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" get Details" /></th>
     </form>
      <form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
     </form>
     </tr>     
 </table>


<div>
<table border="1">
    <tr>
        <th colspan="7" style="background-color:#7c2f97;">Client Activitis</th>
    </tr>
    <tr style="background-color:#f0a64e;">
        <th class="border">ID</th>
        <th class="border">Client Id</th>
        <th class="border">amount</th>
        <th class="border">Activity Date</th>
        <th class="border">Commission</th>
        <th class="border">Description</th>
       
     
    </tr>
    <c:forEach var="client_activity" items="${client_activity}">
        <tr>
            <td>${client_activity.id}</td>
            <td>${client_activity.client_id}</td>
            <td>${client_activity.amount}</td>
            <td>${client_activity.activity_date}</td>
            <td>${client_activity.commission}</td>
            <td>${client_activity.description}</td>           
        </tr>
    </c:forEach>     
</table>
</div>


<div>
ViewClientActivity.jsp
</div>



</body>
</html>