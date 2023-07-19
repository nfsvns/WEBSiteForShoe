package com.poly.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Image;

public interface ImageDAO extends JpaRepository<Image, Long>{
    
//    @Query("select o.image1 from Image where o.Product.id = ?")
//	List<Image> findImage(String id,String image);
}
