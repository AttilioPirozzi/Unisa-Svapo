package it.unisasvapo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.UserBean;

public class CreateNewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
	static{
		information=new DBInformation();
	}
    public CreateNewUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user=new UserBean("0",request.getParameter("nome"),
				request.getParameter("cognome"),
				request.getParameter("città"),
				request.getParameter("via"),
				request.getParameter("cap"),
				request.getParameter("cfiscale"),
				request.getParameter("email"),
				Integer.parseInt(request.getParameter("ncivico")),
				request.getParameter("telefono"),
				""
				);
		String password=request.getParameter("password");
		String registrationState;
		String link;
		if(information.createNewUser(user, password)){
			registrationState="effettuata con successo";
			link="login";
		}
		else{
			registrationState="non riuscita";
			link="registrazione";
		}
		request.setAttribute("state", registrationState);
		request.setAttribute("link", link);
		request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=after_registration").forward(request, response);
		
	}

}
