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
import Core_System.Deposit;
import Core_System.MbankException;

/**
 * Servlet implementation class depositInToAccountServelet
 */
@WebServlet("/depositInToAccount")
public class depositInToAccountServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String AMOUNT_PARAM = "amount";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String ERROR_DEPOSIT_MESSAGE_PARAM = "error_deposit";	
	public static final String SUCCESSFUL_DEPODIT_MESSAGE_PARAM = "successful_deposit_message";


	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);	
		if ((session.getAttribute("client_id") == null) || (session.getAttribute("account_id")) == null){
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		String amnout = (String)request.getParameter(AMOUNT_PARAM);
		String clientid = (String) session.getAttribute("client_id");
		
		int client_id = (int)Integer.parseInt(clientid);
		Client cl = new Client(client_id);
		ClientActivity activity = new ClientActivity(cl);
		Account ac = new Account(cl.getClient_id());
		ac = activity.getAccountBy_Id(ac.getAccount_id());

			
		try {
			activity.depositInToAccount(ac.getAccount_id(),(double) Double.parseDouble(amnout));			
		} catch (Exception e1) {
			session.setAttribute(ERROR_DEPOSIT_MESSAGE_PARAM, e1.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/depositInToAccountjsp.jsp").forward(request, response);
			return;
		}
				try {
					this.getServletConfig().getServletContext().getRequestDispatcher("/depositInToAccountjsp.jsp").forward(request, response);
					return;
				} catch (Exception e) {
					session.setAttribute(ERROR_DEPOSIT_MESSAGE_PARAM, "illegal amount ,deposit Failed, Try again!");
					this.getServletConfig().getServletContext().getRequestDispatcher("/depositInToAccountjsp.jsp").forward(request, response);
					e.printStackTrace();
					return;
			}

			
		}

}
