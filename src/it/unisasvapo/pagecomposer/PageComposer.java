package it.unisasvapo.pagecomposer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisasvapo.javabean.UserBean;

public class PageComposer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PageComposer() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String page=request.getParameter("responsepage");
		if(page==null)
			page="index";
		getServletContext().getRequestDispatcher("/getcategories").include(request, response);
		if(page.equals("index")){
			getServletContext().getRequestDispatcher("/getproduct").include(request, response);	
		}
		else if(page.equals("prodotti")){
			getServletContext().getRequestDispatcher("/getproduct").include(request, response);
		}
		else if(page.equals("prodotto")){
			getServletContext().getRequestDispatcher("/getproductbyid").include(request, response);
		}
		else if(page.equals("login")){
			if(session.getAttribute("user")!=null){
				page=((UserBean)session.getAttribute("user")).getTipo()+"page";
				if(((UserBean)session.getAttribute("user")).getTipo().equals("user")){
					request.removeAttribute("orders");
					getServletContext().getRequestDispatcher("/getorders").include(request, response);
				}
			}
		}
		else if(page.equals("userpage")){
			request.removeAttribute("orders");
				getServletContext().getRequestDispatcher("/getorders").include(request, response);
		}
		else if(page.equals("updateproduct")){
			getServletContext().getRequestDispatcher("/getallproduct").include(request, response);
		}
		else if(page.equals("getorderforadmin")){
			getServletContext().getRequestDispatcher("/getorders").include(request, response);
		}
		else if(page.equals("getusersforadmin")){
			getServletContext().getRequestDispatcher("/getusersforadmin").include(request, response);
		}
		else if(page.equals("deleteproduct")){
			getServletContext().getRequestDispatcher("/getallproduct").include(request, response);
		}
		getServletContext().getRequestDispatcher("/"+page+".jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
