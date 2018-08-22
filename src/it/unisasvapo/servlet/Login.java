package it.unisasvapo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.UserBean;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBean user=null;;
	static GetInformation information;
    static{
    	information=new DBInformation();
    }
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String redirectedPage;
		if(username!=null && password!=null){
			try {
				checkLogin(username, password);
				request.getSession().setAttribute("user", user);
				request.getSession().removeAttribute("error");
				String tipo=user.getTipo();
				redirectedPage="pagecomposer?responsepage="+tipo+"page";
			} catch (Exception e) {
				redirectedPage="pagecomposer?responsepage=login";
				request.getSession().setAttribute("error", e.getMessage());
			}
			response.sendRedirect(redirectedPage);
		}
	}
	private void checkLogin (String username, String password) throws Exception{
		if((user=information.checkUser(username, password))==null){
			throw new Exception("Login fallito");
		}
	}

}
