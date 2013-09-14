package mbank.web;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import Core_System.Client;
import Core_System.ClientActivity;

/**
 * Servlet implementation class ClientActionServelet
 */
@WebServlet("/ClientAction")
public class ViewClientDetailsServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public static final String CLIENT_DETAILS_PARAM = "client_details";
	public static final String ERROR_MESSAGE = "errorMessage";
	
	
//    public ViewClientDetailsServelet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		
		session.getAttribute("client_id");
		session.getAttribute(CLIENT_DETAILS_PARAM);
			
		if(session == null  || session.getAttribute("client_id") == null){
			request.setAttribute(ERROR_MESSAGE, "You must login first");
			
			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    		return;
		}
		String client_idgetAttribute = (String)session.getAttribute("client_id");
	
		int client_id = (int)Integer.parseInt(client_idgetAttribute);
		Client cl = new Client(client_id);
		ClientActivity activity = new ClientActivity(cl);
		try {
			cl=activity.getClientDetails(client_id);
		} catch (Exception e) {
			request.setAttribute(ERROR_MESSAGE, e.getMessage());
    		this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
        	return;
	
		}
		String clientNmae = cl.getClient_name();

    	if(cl.getClient_id() == client_id){ 
    		session.setAttribute(CLIENT_DETAILS_PARAM , cl);
    		session.setAttribute("client_id" ,client_idgetAttribute);
    		session.setAttribute("Client_nameAttribute" ,clientNmae);
    		
    	this.getServletConfig().getServletContext().getRequestDispatcher("/client_details.jsp").forward(request, response);
    	return;
    	
    	}else {
    		request.setAttribute(ERROR_MESSAGE, "Please check your client id again");
    		this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
        	return;
    	}
    	
    	

     }
}

