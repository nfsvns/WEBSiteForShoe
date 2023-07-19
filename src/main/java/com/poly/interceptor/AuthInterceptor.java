package com.poly.interceptor;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.dao.SessionDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@Service
public class AuthInterceptor implements HandlerInterceptor {	
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = (Account) session.getAttribute("user"); // lấy từ session
		String error = "";
		if(user == null) {
			error = "Please login with account admin!";
		}
		//không phải admin hoặc uri tới admin ==> báo lỗi
		else if( !user.getAdmin() && uri.startsWith("/admin/")) {
			error = "Access denied!";
		}
		
		if (error.length() > 0) {
			session.setAttribute("security-uri", uri);
			response.sendRedirect("/login?error="+error);
			return false;
		}
		return true; //cho đi tip controller
	}
}
