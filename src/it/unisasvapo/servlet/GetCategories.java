package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.DBAccess.DBInformation;

public class GetCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static GetInformation information;
    static{
    	information=new DBInformation();
    }
    public GetCategories() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("categories", information.getCategories());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
