package com.poly.service;

import java.util.List;


import com.poly.entity.Account;


public interface AccountService {

List<Account> findAll();
	
	Account findByUsername(String username);
	
	Account save(Account account);
	
	void deleteByUsername(String username);

	boolean existsById(String username);

	List<Account> findByFullname(String fullname);


	List<Account> findByUsernameLike(String username);

	

}
