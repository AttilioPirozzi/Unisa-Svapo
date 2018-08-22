package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.javabean.CartBean;

public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteFromCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		CartBean cart=(CartBean) request.getSession().getAttribute("cart");
		cart.removeById(id);
		response.sendRedirect("pagecomposer?responsepage=carrello");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
