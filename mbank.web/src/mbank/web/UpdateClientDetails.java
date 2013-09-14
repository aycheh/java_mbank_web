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
import Core_System.MbankException;

/**
 * Servlet implementation class UpdateClientDetails
 */
@WebServlet("/UpdateClientDetails")
public class UpdateClientDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public static final String ADDRESS_PARAM = "Address";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String EMAIL_PARAM = "Email";
	public static final String UPDATE_ERROR_MESSAGE_PARAM = "Error_UpdateClientDetails";
	public static final String PHONE_PARAM = "Phone";
	public static final String ONLD_PASSWORD_PARAM = "old_Password";
	public static final String NEW_PASSWORD_PARAM = "New_Password";
	public static final String COMMENT_PARAM = "Comment";
	public static final String SUCCESSFUL_MESSAGE_PARAM = "successful_client_update_message";
	public static final String CLIENT_DETAILS_PARAM = "client_details";

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("client_id") == null) {
			request.setAttribute(ERROR_MESSAGE, "You must login first");

			this.getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		String address = (String) request.getParameter(ADDRESS_PARAM);
		String email = (String) request.getParameter(EMAIL_PARAM);
		String phone = (String) request.getParameter(PHONE_PARAM);
		String old_password = (String) request.getParameter(ONLD_PASSWORD_PARAM);
		String new_password = (String) request.getParameter(NEW_PASSWORD_PARAM);
		String comment = (String) request.getParameter(COMMENT_PARAM);
		String clientid = (String) session.getAttribute("client_id");
		
		System.out.println("old_password --------> "+old_password);
		
		
		int client_id = (int)Integer.parseInt(clientid);
		Client cl = new Client(client_id);
		ClientActivity activity = new ClientActivity(cl);
		try {
			cl=activity.getClientDetails(cl.getClient_id());
		} catch (Exception e1) {
			session.setAttribute(UPDATE_ERROR_MESSAGE_PARAM, e1.getMessage());
			this.getServletConfig().getServletContext().getRequestDispatcher("/updateClientDetails.jsp").forward(request, response);
			return;
		}
		
		System.out.println("From DB --------> "+cl.getPassword());
		
		if (!old_password.equals(cl.getPassword())){
			session.setAttribute(UPDATE_ERROR_MESSAGE_PARAM, "old password dose not match, Try again!");
			this.getServletConfig().getServletContext().getRequestDispatcher("/updateClientDetails.jsp").forward(request, response);
			return;
		}
		
		cl = new Client(cl.getClient_id(), cl.getClient_name(),new_password , Data_Access.Type.PLATINUM, address, email, phone, comment);

				try {
					activity.updateClientDetails(cl);
					cl = activity.getClientDetails(cl.getClient_id());
					String clientNmae = cl.getClient_name();
					session.setAttribute("Client_nameAttribute", clientNmae);		
					session.setAttribute(SUCCESSFUL_MESSAGE_PARAM, "your delaits are updated");
					session.setAttribute(CLIENT_DETAILS_PARAM , cl);
					this.getServletConfig().getServletContext().getRequestDispatcher("/updateClientDetails.jsp").forward(request, response);
					return;
				} catch (Exception e) {
					session.setAttribute(UPDATE_ERROR_MESSAGE_PARAM, "update Failed, Try again!");
					this.getServletConfig().getServletContext().getRequestDispatcher("/updateClientDetails.jsp").forward(request, response);
					e.printStackTrace();
					return;
				}

			
		}
	
}



