package com.poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.SessionDAO;
import com.poly.entity.Account;
import com.poly.entity.Product;
import com.poly.service.AccountValidate;
import com.poly.service.SessionService;



@Controller
@RequestMapping("")
public class LoginController {
	String path="";
//	MESSAGE_CONSTANT MESSAGE=new MESSAGE_CONSTANT();
	AccountValidate accountValidate=new AccountValidate();
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO prodao;

	@GetMapping("/login")
	public String login(Model model,@RequestParam Optional<String> urlReturn,@RequestParam Optional<String> error) {
		path=urlReturn.isPresent()?urlReturn.get():"";
		if(error.isPresent()) {
			model.addAttribute("message", error.get());
		}
		return "user/login";
	}

//	@GetMapping("/logout")
//	public String logout(@RequestParam Optional<String> urlReturn) {
//		session.clear();
//		return urlReturn.isPresent()?"redirect:/" +urlReturn.get():"redirect:/";
//	}
	@RequestMapping("/admin")
	public String admin() {
		Account user = session.getAttribute("user");
		if(!user.getAdmin()) {			
			String error="Khong du quyen truy cap ";
			return "redirect:/login?error="+error;
		}
		return "/admin/admin";
	}
	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		session.removeAttribute("security-uri");
		return "redirect:/index";
	}
	@PostMapping("/login")
	public String login(Model model, @RequestParam String username, @RequestParam String password) {
		try {
			Account user = accountDAO.findById(username).get();	
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			}
			else {
				session.setAttribute("user", user); 
				String uri = (String) session.getAttribute("security-uri");
				if (uri != null) {
					return "redirect:" + uri;
				} 
				else {
					model.addAttribute("message", "Login succeed");
					return "redirect:/index";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "/user/login";
	}
}
