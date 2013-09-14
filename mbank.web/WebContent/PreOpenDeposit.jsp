<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                 
                   <input type="hidden" value="${client_id}"/>
                   
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
              <div class="errMsg">               				
    </form>
</table>



       

<table border="1">
 <tr>
     <tr>
      <form action="viewAccountDetails" method="get">
     	<th><input class="white_button" name="commit" type="submit" value="Get Account Details" /></th>
     	</form>    	
     	
     	
     	<form action="withdraw.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" withdraw" /></th>
     	</form>

     	<form action="ClientAllDeposits" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" view Your Diposits" /></th>
     	</form>
     	
     <form action="depositInToAccountjsp.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" depositInToAccount" /></th>
     	</form>>
     	
     	<form action="createNewDeposit.jsp" method="get">
     	<th><input class="white_button" name="commit" type="submit" value=" create New Deposit" /></th>
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
 
 	<form action="PreOpenDeposit" method="get">
       	<th> Deposit ID : <input type="text" name="deposit_id" size="8" required onkeypress="return isNumber(event)"/>
     	<th><input class="white_button" name="commit" type="submit" value="pre Open Deposit" /> </th>
     	</form>


</div>

<div>
<table id="withdraw_message">  
<tr><td> ${pre_open_message}</td></tr>
</table> 
</div>

PreOpenDeposit.jsp page



</body>
</html>