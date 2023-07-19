package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	@Query("SELECT a FROM Account a WHERE a.fullname LIKE :username")
	List<Account> findByFullname(@Param("username") String username);
	@Query("SELECT a FROM Account a WHERE a.username LIKE :username")
	List<Account> findByUsernameLike(@Param("username") String username);
}
