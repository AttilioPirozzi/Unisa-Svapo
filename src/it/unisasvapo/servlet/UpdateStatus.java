package it.unisasvapo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
	static {
	    information=new DBInformation();
    }
    public UpdateStatus() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		int value=Integer.parseInt(request.getParameter("value"));
		if(information.updateState(id,value)){
			request.setAttribute("state", "riuscita");
	}else{
		request.setAttribute("state", "non riuscita");
	}
	request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=after_updateorder").forward(request, response);
	
	
}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
}
}
