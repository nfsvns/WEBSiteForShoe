package com.poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.poly.dao.AccountDAO;
import com.poly.entity.Account;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired AccountDAO acDAO;

	@Override
	public List<Account> findAll() {
		// TODO Auto-generated method stub
		return acDAO.findAll();
	}

	@Override
	public Account findByUsername(String username) {
		// TODO Auto-generated method stub
		return acDAO.findById(username).get();
	}

	@Override
	public Account save(Account account) {
		// TODO Auto-generated method stub
		return acDAO.save(account);
	}

	@Override
	public void deleteByUsername(String username) {
		// TODO Auto-generated method stub
		acDAO.deleteById(username);
	}

	@Override
	public boolean existsById(String username) {
		// TODO Auto-generated method stub
		return acDAO.existsById(username);
	}

	@Override
	public List<Account> findByFullname(String fullname) {
		// TODO Auto-generated method stub
		return acDAO.findByFullname(fullname);
		
	}

	@Override
	public List<Account> findByUsernameLike(String username) {
		// TODO Auto-generated method stub
		return null;
	}



	




	


}
