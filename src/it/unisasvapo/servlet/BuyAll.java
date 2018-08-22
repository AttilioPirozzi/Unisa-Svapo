package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.CartBean;
import it.unisasvapo.javabean.UserBean;

@WebServlet("/buyall")
public class BuyAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
    static{
    	information=new DBInformation();
    }
  
   
    public BuyAll() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartBean cart =(CartBean)(request.getSession()).getAttribute("cart");
		String userId=((UserBean)(request.getSession()).getAttribute("user")).getCodice();
		String state=null;
		if(information.buy(userId,cart)){
			cart=new CartBean();
			request.getSession().setAttribute("cart", cart);
			state="confermato";
		}
		request.setAttribute("state", state);
		request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=after_buy").forward(request, response);
	}

}
