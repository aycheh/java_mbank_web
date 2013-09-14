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

	<form action="Logout" method="get">
     <p style="clear:both">
 		<input class="white_button" name="commit" type="submit" value="Logout" />
                   Welcome :  ${Client_nameAttribute}
                  <div class="errMsg">${errorMessage}</div>
  </form>
<img src="images/Bank.png" name="home_img" border="0" id="home_img" style="height: 156px; width: 367px; "/>

<table border="1">
 <tr>
     <tr>
     <form action="viewAccountDetails" method="get">
     	<th><input class="white_button" name="commit" type="submit" value="Get Account Details" /></th>
     	</form>
     	 <form action="PreOpenDeposit.jsp" method="get">    	
     	<th><input class="white_button" name="commit" type="submit" value=" preOpenDeposit" /> </th>
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
     	
     	<form action="ClientAction" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" get Details" /></th>
     </form>
     <form action="dashboard.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" Home" /></th>
     </form>
     </tr>     
 </table>  





 <table border="1">
    <tr>
        <th colspan="7" style="background-color:#7c2f97;">Client deposits</th>
    </tr>
    <tr style="background-color:#f0a64e;">
        <th class="border">deposit ID</th>
        <th class="border">client Id</th>
        <th class="border">balance</th>
        <th class="border">type</th>
        <th class="border">estimated balance</th>
        <th class="border">opening date</th>
        <th class="border">closing date</th>
        
    </tr>
    <c:forEach var="deposits" items="${deposits}">
        <tr>
            <td>${deposits.deposit_id}</td>
            <td>${deposits.client_id}</td>
            <td>${deposits.balance}</td>
            <td>${deposits.type}</td>
            <td>${deposits.estimated_balance}</td>
            <td>${deposits.opening_date}</td>
            <td>${deposits.closing_date}</td>           
        </tr>
    </c:forEach>     
</table>

 
ClientAllDeposits.jsp


</body>
</html>