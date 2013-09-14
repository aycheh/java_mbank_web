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

/**
 * Servlet implementation class Withdraw
 */
@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String CLIENT_DETAILS_PARAM = "client_details";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String ACCOUNT_ID_PARAM = "account_id";
	public static final String WITHDRAW_MESSAGE_PARAM = "withdraw_message";
	public static final String AMOUNT_PARAM = "amount";
	public static final String TIME_PARAM = "time";

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

		
		if (session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		if (session.getAttribute(TIME_PARAM) != null) {
			session.setAttribute(TIME_PARAM, null);
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			return;
		}

		String amountparam = (String)request.getParameter(AMOUNT_PARAM);
		String client_id = (String) session.getAttribute("client_id");
		session.getCreationTime();

		
		double amount = Double.parseDouble(amountparam);
		Client cl = new Client((int)Integer.parseInt(client_id));
		ClientActivity activity = new ClientActivity(cl);
		
		try {				
			cl=activity.getClientDetails(cl.getClient_id());			
		} catch (Exception e1) {
			request.setAttribute(ERROR_MESSAGE, e1.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			return;

		}
		Account ac = new Account((int) Integer.parseInt(client_id));		
		try {
			ac = activity.getAccountBy_Id(ac.getAccount_id());
			activity.withdraw(ac.getAccount_id(), amount);
		
		String clientNmae = cl.getClient_name();

		session.setAttribute(ACCOUNT_ID_PARAM, ac.getAccount_id());
		session.setAttribute("Client_nameAttribute", clientNmae);
		session.setAttribute("client_id" ,client_id);
		session.setAttribute(TIME_PARAM, session.getCreationTime());
		session.setAttribute(WITHDRAW_MESSAGE_PARAM, "Thanks' for using this system");
		this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
		System.out.println(session.getCreationTime());
		return;
		
		} catch (MbankException e) {
			request.setAttribute(ERROR_MESSAGE, e.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			return;

		}
	
	}
		
}


