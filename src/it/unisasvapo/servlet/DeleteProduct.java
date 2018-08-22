package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;


@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
	static{
		information=new DBInformation();
	}
    public DeleteProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("prodotto");
		if(information.DeleteProduct(id)){
			request.setAttribute("state", "riuscita");
		}else{
			request.setAttribute("state", "non riuscita");
		}
		request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=after_delete").forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
