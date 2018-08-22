package it.unisasvapo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisasvapo.DBAccess.DBInformation;
import it.unisasvapo.DBAccess.GetInformation;
import it.unisasvapo.javabean.ProductBean;

@WebServlet("/newproduct")
public class NewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GetInformation information;
	static {
		information=new DBInformation();
	}
    public NewProduct() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codiceProdotto=(String)request.getParameter("codiceProdotto");
		String descrizione = (String)request.getParameter("descrizione");
		String misura=(String)request.getParameter("misura");
		float prezzoAcquisto=Float.parseFloat(request.getParameter("prezzoacquisto"));
		float prezzoVendita=Float.parseFloat(request.getParameter("prezzovendita"));
		String aliquota=request.getParameter("aliquota");
		String categoria=(String)request.getParameter("categoria");
		String state=null;
		String link_text=null;
		if(information.createNewProduct(new ProductBean(codiceProdotto,prezzoAcquisto,
				prezzoVendita,aliquota,misura,categoria,descrizione,0))){
			state="riuscita";
			link_text="Aggiungi un altro prodotto";
		}else{
			state="non riuscita";
			link_text="Errore, clicca qui per ritentare";
		}
		request.setAttribute("state",state);
		request.setAttribute("link", link_text);
		request.setAttribute("prod", codiceProdotto);
		
		request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=after_add").forward(request, response);
	}

}
