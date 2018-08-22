package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.UserBean;

public class GetOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static GetInformation information;
    static{
    	information=new DBInformation();
    }
    public GetOrders() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codice=Integer.parseInt(((UserBean)request.getSession().getAttribute("user")).getCodice());
		request.setAttribute("orders", information.getOrderByUserId(codice));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
