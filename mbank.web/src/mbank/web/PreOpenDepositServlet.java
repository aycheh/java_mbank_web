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

import Core_System.Account;
import Core_System.Client;
import Core_System.ClientActivity;
import Core_System.Deposit;
import Core_System.MbankException;

/**
 * Servlet implementation class PreOpenDepositServlet
 */
@WebServlet("/PreOpenDeposit")
public class PreOpenDepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String PRE_OPEN_DEPOSIT_MESSAGE_PARAM = "pre_open_message";
	public static final String DEPOSIT_ID_PARAM = "deposit_id";

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

		
		if (session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		String deposit = (String)request.getParameter(DEPOSIT_ID_PARAM);
		int deposit_id = (int)Integer.parseInt(deposit);
		if (deposit_id <= 0 ){
			request.setAttribute(ERROR_MESSAGE, "illigal Deposit Id");
			this.getServletConfig().getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			System.out.println(session.getCreationTime());
			return;	
		}
		
		String client_id = (String) session.getAttribute("client_id");
		session.getCreationTime();

		
		
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
	
			activity.PreOpenDeposit(deposit_id, cl.getClient_id(), ac.getAccount_id());

		session.setAttribute("client_id" ,client_id);
		session.setAttribute(PRE_OPEN_DEPOSIT_MESSAGE_PARAM, "Thanks' for using this system");
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
