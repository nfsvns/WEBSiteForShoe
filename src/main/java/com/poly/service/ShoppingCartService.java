package com.poly.service;

import java.util.Collection;

import com.poly.model.CartItem;



public interface ShoppingCartService {

	int getCount();

	double getAmount();

	void update(long id, int quantity);

	void clear();

	Collection<CartItem> getCartItems();

	void remove(long id);

	void add(CartItem item);

}
