package com.poly.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.SessionDAO;
import com.poly.entity.Account;
import com.poly.service.AccountValidate;


@Controller
@RequestMapping("signup")
public class RegisterController {
//	MESSAGE_CONSTANT MESSAGE=new MESSAGE_CONSTANT();
	AccountValidate accountValidate=new AccountValidate();
	
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	SessionDAO session;	
	
	@GetMapping("")
	public String showRegister(Model model) {
		return "user/signup";
	}
	@PostMapping("")
	public String login(Model model, 
			@RequestParam String username, 
			@RequestParam String email,
			@RequestParam String password,
			@RequestParam String repeatPass) {
		boolean registerSuccess = true;
		List<String> listCheck=new ArrayList<>();
		listCheck.add(username);
		listCheck.add(email);
		listCheck.add(password);
		listCheck.add(repeatPass);
		
		if (!accountValidate.listIsNullOrEmpty(listCheck)) {
			List<Account> list = accountDAO.findAll();
			for (Account account : list) {
				if (username.equalsIgnoreCase(account.getUsername())) {
//					System.out.println(account);
					model.addAttribute("message","Ton tai");
					registerSuccess = false;
					return "user/signup";
				}
			}
		}
		if(registerSuccess) {
			Account kh=new Account();
			kh.setUsername(username);
			kh.setEmail(email);
			kh.setFullname(username);
			kh.setPassword(password);
			kh.setPhoto("hi.jpg");
			kh.setActivated(true);
			kh.setAdmin(false);
			accountDAO.save(kh);
			return "redirect:/login";
		}else {
			return "redirect:/signup";
		}
		
	}


	
	
	
}
