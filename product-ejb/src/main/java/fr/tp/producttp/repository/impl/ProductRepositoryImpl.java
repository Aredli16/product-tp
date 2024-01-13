package fr.tp.producttp.repository.impl;

import fr.tp.producttp.entity.Product;
import fr.tp.producttp.repository.ProductRepository;
import jakarta.ejb.Singleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Singleton
public class ProductRepositoryImpl implements ProductRepository {
	@PersistenceContext(unitName = "default")
	private EntityManager entityManager;
	
	@Override
	public List<Product> findAll() {
		return entityManager.createNamedQuery("Product.findAll", Product.class).getResultList();
	}
	
	@Override
	public Product findById(Long id) {
		return entityManager.find(Product.class, id);
	}
	
	@Override
	public Product save(Product product) {
		entityManager.persist(product);
		return product;
	}
	
	@Override
	public Product update(Product product) {
		return entityManager.merge(product);
	}
	
	@Override
	public void deleteById(Long id) {
		entityManager.remove(findById(id));
	}
}
