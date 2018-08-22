package it.unisasvapo.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.ProductBean;

/**
 * Servlet implementation class GetAllProduct
 */
@WebServlet("/getallproduct")
public class GetAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static GetInformation information;
	    static{
	    	information=new DBInformation();
	    } 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductBean> products=information.getAllProductInList();
		request.setAttribute("allProduct", products);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
