package it.unisasvapo.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.ProductBean;

public class GetProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
    static{
    	information=new DBInformation();
    }

    public GetProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categories= request.getParameter("searchcat");
		ArrayList<ProductBean> products=new ArrayList<ProductBean>();
		if(categories!=null){
			if(categories.equalsIgnoreCase("all")){
				products=information.getAllProduct();
			}
			else{
				products=information.getProductByCategory(categories);
			}	
		}
		if(products.isEmpty())
			products=null;
		request.setAttribute("productlist", products);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
