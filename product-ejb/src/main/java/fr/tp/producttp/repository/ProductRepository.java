package fr.tp.producttp.repository;

import fr.tp.producttp.entity.Product;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface ProductRepository {
	List<Product> findAll();
	
	Product findById(Long id);
	
	Product save(Product product);
	
	Product update(Product product);
	
	void deleteById(Long id);
}
