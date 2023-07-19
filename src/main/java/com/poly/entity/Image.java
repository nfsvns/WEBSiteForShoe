package com.poly.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Images")
public class Image {

	@Id
	String id;
	@ManyToOne @JoinColumn(name = "product_id")
	Product product;
	@Column(name = "image1")
	String image1;
	@Column(name = "image2")
	String image2;
	@Column(name = "image3")
	String image3;
	@Column(name = "image4")
	String image4;
	@Column(name = "image5")
	String image5;
	@Column(name = "image6")
	String image6;
}
