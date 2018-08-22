package it.unisasvapo.servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet(name = "/FileUploadServlet", 
			urlPatterns = { "/fileupload" }, 
			initParams = {@WebInitParam(name = "file-upload", value = "img/prodotti") })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB after which the file will be 
													  // temporarily stored on disk
				 maxFileSize = 1024 * 1024 * 10, // 10MB maximum size allowed for uploaded files
				 maxRequestSize = 1024 * 1024 * 50) // 50MB overall size of all uploaded files
public class FileUploadServlet extends HttpServlet {
	


	public FileUploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		out.write("Error: GET method is used but POST method is required");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		String codP=request.getParameter("prodName");
		String savePath = request.getServletContext().getRealPath("img/prodotti/")+codP;
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		Part part =request.getPart("image");
		String fileName = "prodotto.jpg";
		part.write(savePath + File.separator + fileName);
		System.out.println(savePath + File.separator + fileName);
		request.getServletContext().getRequestDispatcher("/pagecomposer?responsepage=prodotti&searchcat=all").forward(request, response);
	}
	

}

