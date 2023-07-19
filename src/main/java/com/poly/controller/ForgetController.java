package com.poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
import com.poly.service.AccountService;
import com.poly.service.AccountValidate;
import com.poly.service.MailerService;



@Controller
@RequestMapping("")
public class ForgetController {
	
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionDAO session;
	@Autowired
    AccountService aService;
    @Autowired
    MailerService mailer;
    
	@GetMapping("/forget-password")
	public String forget() {
		return "/user/forget-password";
	}
	
	@PostMapping("/forget-password")
	public String forget(@RequestParam("username") String username, Model model) {
		try {
			Account account = aService.findByUsername(username);
//			System.out.println(username);
			String to = account.getEmail();
			
			String email = to.substring(0, 2);
		
			double randomDouble = Math.random();
            randomDouble = randomDouble * 1000000 + 1;
            int randomInt = (int) randomDouble;
			
			String subject = "Lấy lại mật khẩu";
			String body = "Mật khẩu của bạn là:"+randomInt;
			mailer.queue(to, subject, body);
			
			account.setPassword(String.valueOf(randomInt));
			aService.save(account); 
			
			model.addAttribute("message", "Mật khẩu mới đã được gửi đến mail "+email+"***");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message ",e);
		}
		return "/user/forget-password";
	}
}
