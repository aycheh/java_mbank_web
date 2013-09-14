package mbank.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Core_System.Client;
import Core_System.ClientActivity;
import Core_System.Deposit;

/**
 * Servlet implementation class DepositServelet
 */
@WebServlet("/Deposit")
public class DepositServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String AMOUNT_PARAM = "amount";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String OPENING_DATE_PARAM = "opening_date";
	public static final String ERROR_DEPOSIT_MESSAGE_PARAM = "error_deposit";
	public static final String CLOSING_DATE_PARAM = "closing_date";
	public static final String SUCCESSFUL_DEPODIT_MESSAGE_PARAM = "successful_deposit_message";
	public static final String DEPOSIT_DETAILS_PARAM = "deposit_details";
	public static final String CLIENT_DETAILS_PARAM = "client_details";

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		
		if (session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		String balance1 = (String)request.getParameter(AMOUNT_PARAM);
		String opning_date = (String)request.getParameter(OPENING_DATE_PARAM);
		String closintg_date = (String)request.getParameter(CLOSING_DATE_PARAM);
		String clientid = (String) session.getAttribute("client_id");
		
		
		int client_id = (int)Integer.parseInt(clientid);
		Client cl = new Client(client_id);
		ClientActivity activity = new ClientActivity(cl);
		
		try {
			cl=activity.getClientDetails(cl.getClient_id());
		} catch (Exception e1) {
			session.setAttribute(ERROR_DEPOSIT_MESSAGE_PARAM, e1.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/createNewDeposit.jsp").forward(request, response);
			return;
		}
		
		double balance = (double) Double.parseDouble(balance1);	
		Deposit dp = new Deposit(0,cl.getClient_id(),balance,null,0,opning_date,closintg_date);
		
				try {
					activity.createNewDeposit(dp);
					cl = activity.getClientDetails(cl.getClient_id());
					String clientNmae = cl.getClient_name();
					session.setAttribute("Client_nameAttribute", clientNmae);		
					session.setAttribute(SUCCESSFUL_DEPODIT_MESSAGE_PARAM, "your deposit is succsid");
					session.setAttribute(CLIENT_DETAILS_PARAM , cl);
					session.setAttribute(DEPOSIT_DETAILS_PARAM , dp);
					this.getServletConfig().getServletContext().getRequestDispatcher("/createNewDeposit.jsp").forward(request, response);
					return;
				} catch (Exception e) {
					session.setAttribute(ERROR_DEPOSIT_MESSAGE_PARAM, "illegal amount ,deposit Failed, Try again!");
					this.getServletConfig().getServletContext().getRequestDispatcher("/createNewDeposit.jsp").forward(request, response);
					e.printStackTrace();
					return;
				}

			
		}
}
