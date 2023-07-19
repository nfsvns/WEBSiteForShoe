package com.poly.dao;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Product;

public interface ShoppingCartDAO{
	double getAmount();

	void clear();

	int getCount();

	void remove(long id);

	void update(long id, int quantity);

	void add(Product item);

	Collection<Product> getAll();
}
