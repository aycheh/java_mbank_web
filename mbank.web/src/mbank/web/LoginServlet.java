package mbank.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.connector.Request;

import Core_System.Account;
import Core_System.Client;
import Core_System.ClientActivity;
import Core_System.MBank;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
		public class LoginServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
    public LoginServlet() {
        super();
        System.out.println("LoginServlet");
    }
    
    public static final String CLIENT_ID_PARAM = "client_id";
    public static final String PASSWORD_PARAM = "password";
    public static final String ERROR_MWSSAGE = "errorMessage";
    public static final String ACCOUNT_ID_PARAM = "account_id";
    MBank b = MBank.getInstance();
   
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
    	String client_id = request.getParameter(CLIENT_ID_PARAM);
    	String password = request.getParameter(PASSWORD_PARAM);
    	 
    	
    	if (client_id == null || client_id.trim().isEmpty() || client_id.length() <= 0
    		|| password == null || password.trim().isEmpty() ||b.login((int)Integer.parseInt(client_id), password) == null ){
    		
    		request.setAttribute(ERROR_MWSSAGE, "Invalid email/password combination, try again");
    
   		this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    	return;	
    	}

    	
    	Client client = new Client((int)Integer.parseInt(client_id));
    	ClientActivity activity = new ClientActivity(client);
    	
    
    	try {
			client = activity.getClientDetails(client.getClient_id());
		} catch (Exception e) {
	   		request.setAttribute(ERROR_MWSSAGE, e.getMessage());
	   		this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	    	return;
		}
    	client.getClient_name();
    	String clientNmae = client.getClient_name();
    	activity.getAccountBy_Id(client.getClient_id());
    	Account ac = activity.getAccountBy_Id(client.getClient_id());
    	

    	
    	
    	HttpSession session =  request.getSession(true);
    	if (!session.isNew()){
    		session.invalidate();
    		session = request.getSession(true);
    	}
    	
    	
    	session.setAttribute("welcaomeMsg" ,"  Wellcome  ");
    	session.setAttribute("client_id" ,client_id);
    	session.setAttribute("Client_nameAttribute" ,clientNmae);
    	session.setAttribute(ACCOUNT_ID_PARAM ,ac.getAccount_id());
    	
	
    	this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
    	return;
    }  

}

