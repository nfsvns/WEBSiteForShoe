package com.poly.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.entity.Product;


@Service
@SessionScope
public class ShoppingCartImp implements ShoppingCartDAO {
	public Map<Long, Product> map = new HashMap<Long, Product>();

	@Override
	public double getAmount() {
		double amount = 0;
		for (Product item : map.values()) {
			amount += item.getPrice() * item.getQuantity();
		}
		return amount;
	}

	@Override
	public void clear() {
		map.clear();
		
	}

	@Override
	public int getCount() {
		int count = 0;
		for (Product item : map.values()) {
			count += item.getQuantity();
		}
		return count;
	}

	@Override
	public void remove(long id) {
		map.remove(id);
		
	}

	@Override
	public void update(long id, int quantity) {
		Product item = map.get(id);
		item.setQuantity(quantity);
		if (item.getQuantity() <= 0) {
			map.remove(item.getId());
		}
	}
		
	

	@Override
	public void add(Product item) {
		Product existedItem = map.get(item.getId());
		if (existedItem != null) {
			existedItem.setQuantity(item.getQuantity() + existedItem.getQuantity());
		} else {
			map.put(item.getId(), item);
		}

		
	}

	@Override
	public Collection<Product> getAll() {
		return map.values();
	}

	
}
