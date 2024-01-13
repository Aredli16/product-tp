package fr.tp.producttp;

import fr.tp.producttp.entity.Product;
import fr.tp.producttp.entity.Product.Type;
import fr.tp.producttp.repository.ProductRepository;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddProductServlet", value = "/add-product")
public class AddProductServlet extends HttpServlet {
	@EJB
	private ProductRepository productRepository;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("add-product.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		Double price = Double.parseDouble(req.getParameter("price"));
		Type type = Type.valueOf(req.getParameter("type"));
		
		Product product = new Product();
		product.setName(name);
		product.setDescription(description);
		product.setPrice(price);
		product.setType(type);
		
		productRepository.save(product);
		
		resp.sendRedirect(req.getContextPath() + "/");
	}
}
