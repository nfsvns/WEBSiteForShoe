package com.poly.dao;



import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;
import com.poly.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Long>{
//@Query("\r\n"
//		+ "Select o from Product p\r\n"
//		+ "inner join Image im on im.product = p.id")
//List<Product> findAll();
	@Query("Select o from Product o where o.category like 'NK' ")
	Page<Product> findImageNK(Pageable pageable);
	@Query("Select o from Product o where o.category like 'AD' ")
	Page<Product> findImageAD(Pageable pageable);
	@Query("Select o from Product o where o.category like 'M' ")
	Page<Product> findImageM(Pageable pageable);
//	Optional<Product> findById(String id);
	@Query("Select o from Product o where o.category like 'NK' ")
	List<Product> findImageNK();

	@Query("SELECT new Report(o.category, sum(o.price), count(o)) " + " FROM Product o " + " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();
}
