package mbank.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Core_System.Account;
import Core_System.Client;
import Core_System.ClientActivity;
import Core_System.MbankException;

@WebServlet("/viewAccountDetails")
public class viewAccountDetailsServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final String CLIENT_DETAILS_PARAM = "client_details";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String ACCOUNT_ID_PARAM = "account_id";

	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		System.out.println("String client_idgetAttribute >>> " + (String) session.getAttribute("client_id"));

		session.getAttribute("client_id");


		if (session == null || session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		



		int client_id = (int) Integer.parseInt((String) session.getAttribute("client_id"));
		Client cl = new Client(client_id);
		ClientActivity activity = new ClientActivity(cl);
		try {
			cl = activity.getClientDetails(cl.getClient_id());
		} catch (Exception e1) {
			request.setAttribute(ERROR_MESSAGE,  e1.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			return;
		}
		Account ac = new Account(cl.getClient_id());
		cl.getClient_name();
		try {
			ac = activity.getAccountBy_Id(cl.getClient_id());
			ac = activity.viewAccountDetails(ac.getAccount_id());
		} catch (MbankException e) {
			e.printStackTrace();

		}
		if (ac.getClient_id() != cl.getClient_id()) {
			System.out.println("ac.getClient_id()"  + ac.getClient_id());
			System.out.println("cl.getClient_id()" + cl.getClient_id());
			request.setAttribute(ERROR_MESSAGE,"  Invalid Account ID , try again");
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			return;
		}

		String clientNmae = cl.getClient_name();

			session.setAttribute(ACCOUNT_ID_PARAM, cl.getClient_id());
			session.setAttribute("Client_nameAttribute", clientNmae);
			session.setAttribute("account", ac);
			this.getServletConfig().getServletContext().getRequestDispatcher("/viewAccountDetails.jsp").forward(request, response);
			return;
		}
	}


