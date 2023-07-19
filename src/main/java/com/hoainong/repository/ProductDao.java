package com.hoainong.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hoainong.model.Product;


public interface ProductDao extends JpaRepository<Product, Integer>{

    @Query("SELECT p FROM Product p WHERE p.name LIKE %?1%")
    Page<Product> findByNameCategory(String keyword, Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.name LIKE %?1%")
    List<Product> findByNameCategory(String keyword);
    
    @Query("SELECT p FROM Product p WHERE p.category.name LIKE %?1%")
    Page<Product> findByNameAccessories(String keyword, Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.name LIKE %?1%")
    List<Product> findByNameAccessories(String keyword);
    
    @Query("Select o from Product o where o.name Like ?1")
	List<Product> findbyGioiTinh(String Keyword , String Keyword2 , String Keyword3);
	
	@Query("SELECT p.image FROM Product p where p.productID = ?1")
	List<String> findByProductId(Integer id);

}
