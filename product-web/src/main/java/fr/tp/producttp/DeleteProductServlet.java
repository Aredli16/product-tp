package fr.tp.producttp;

import fr.tp.producttp.repository.ProductRepository;
import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteProductServlet", value = "/delete-product")
public class DeleteProductServlet extends HttpServlet {
	@EJB
	private ProductRepository productRepository;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			Long id = Long.parseLong(req.getParameter("id"));
			
			productRepository.deleteById(id);
			
			resp.sendRedirect(req.getContextPath() + "/");
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/");
		}
	}
}
