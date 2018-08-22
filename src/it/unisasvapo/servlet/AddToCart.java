package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.CartBean;
import it.unisasvapo.javabean.ProductBean;

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
    static{
    	information=new DBInformation();
    }

    public AddToCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		CartBean cart=(CartBean)session.getAttribute("cart");
		if(cart==null)
			cart=new CartBean();
		String id=request.getParameter("id");
		ProductBean product = information.getProductById(id);
		Float quantity=Float.parseFloat(request.getParameter("quantity"));
		if(product!=null)cart.addProduct(product,quantity);
		session.setAttribute("cart", cart);
		response.sendRedirect("pagecomposer?responsepage=prodotti&searchcat=all");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

