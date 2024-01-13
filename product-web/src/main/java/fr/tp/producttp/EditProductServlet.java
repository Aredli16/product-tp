package fr.tp.producttp;

import fr.tp.producttp.entity.Product;
import fr.tp.producttp.repository.ProductRepository;
import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EditProductServlet", value = "/edit-product")
public class EditProductServlet extends HttpServlet {
	@EJB
	private ProductRepository productRepository;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			Product product = productRepository.findById(Long.parseLong(req.getParameter("id")));
			
			req.setAttribute("product", product);
			
			req.getRequestDispatcher("edit-product.jsp").forward(req, resp);
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			Product product = productRepository.findById(Long.parseLong(req.getParameter("id")));
			
			product.setName(req.getParameter("name"));
			product.setDescription(req.getParameter("description"));
			product.setPrice(Double.parseDouble(req.getParameter("price")));
			
			productRepository.update(product);
			
			resp.sendRedirect(req.getContextPath() + "/");
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/");
		}
	}
}
