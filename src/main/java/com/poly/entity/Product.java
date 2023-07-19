package com.poly.entity;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne @JoinColumn(name = "category_id")
	Category category;
	String name;
	Double price;
	Integer size;
	Integer quantity;
	@Temporal(TemporalType.DATE)
	@Column(name = "create_date")
	Date create_date = new Date();
	Boolean available;
	@Column(name="image")
	String image;
	@Column(name="description")
	String description;
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
	@OneToMany(mappedBy = "product")
	List<Image> images;
}
