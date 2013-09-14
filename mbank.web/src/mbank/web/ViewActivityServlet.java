package mbank.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Core_System.Activity;
import Core_System.Client;
import Core_System.ClientActivity;
import Core_System.Deposit;
import Core_System.MBank;
import Core_System.MbankException;

/**
 * Servlet implementation class ViewActivityServlet
 */
@WebServlet("/ViewActivity")
public class ViewActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	public static final String CLIENT_ID_PARAM = "client_id";
    public static final String PASSWORD_PARAM = "password";
    public static final String ERROR_MWSSAGE = "errorMessage";
    public static final String VIEW_CLIENT_ACTIVITY_PARAM = "client_activity";
    MBank b = MBank.getInstance();
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		

		if (session == null || session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MWSSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		String client_idAttribute = (String)session.getAttribute("client_id");
		int client_id = (int)(Integer.parseInt(client_idAttribute));
		

		Client client = new Client(client_id);
		ClientActivity activity = new ClientActivity(client);
		List<Activity> activitys1 = new ArrayList<Activity>();
		try {
			activitys1 = activity.ViewClientActivities(client.getClient_id());
		} catch (MbankException e) {
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			e.printStackTrace();
	    	return;
		}
		
		for (Activity act : activitys1){
			session.setAttribute("View Client Activities ,,,,,,,,,,,,:" ,act);	
		}
		
		
    	session.setAttribute(VIEW_CLIENT_ACTIVITY_PARAM ,activitys1);
    	this.getServletConfig().getServletContext().getRequestDispatcher("/ViewClientActivities.jsp").forward(request, response);
    	return;
    	
		
	}

}
