package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.ImageDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;

import com.poly.entity.Account;
import com.poly.entity.Image;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.entity.Report;


@Controller
public class AdminController {
	@Autowired
	ProductDAO prodao;
	@Autowired
	AccountDAO usdao;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	ImageDAO imageDAO;

//	@Autowired
//	ReportOrderDAO rpOrderDAO;

	@Autowired
	OrderDetailDAO odDAO;

//	@RequestMapping("/admin")
//	public String admin(Model model) {
//
//		return "/admin/admin";
//	}

	@RequestMapping("/admin/reportCategory")
	public String adminCategory(Model model) {
		List<Report> items = prodao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "/tables/staByType";
	}

	@RequestMapping("/admin/reportUser")
	public String adminUser(Model model, @ModelAttribute("AccountsForm") Account account) {
		model.addAttribute("accounts", usdao.findAll());
		return "/tables/mnAccount";
	}

	@RequestMapping("/admin/reportProducts")
	public String adminProduct(Model model) {
		model.addAttribute("products", prodao.findAll());
		return "/tables/mnCategory";
	}

	@RequestMapping("/admin/reportOrders")
	public String adminOders(Model model) {
		model.addAttribute("product", prodao.findAll());
		return "/tables/mnOrder";
	}

// admin products
	@RequestMapping("/admin/createProducts")
	public String createProduct(Model model, @Validated @ModelAttribute("ProductsForm") Product product,
			BindingResult result) {

		prodao.save(product);
		model.addAttribute("success_account", "Create account success!");

		Product item = new Product();
		model.addAttribute("item", item);
		model.addAttribute("products", prodao.findAll());
		return "tables/mnCategory";
	}

	@RequestMapping("/admin/updateProducts")
	public String updateProducts(Model model, @Validated @ModelAttribute("ProductsForm") Product product,
			BindingResult result) {

		prodao.save(product);
		model.addAttribute("success_account", "Update account success!");

		model.addAttribute("products", prodao.findAll());
		return "tables/mnCategory";

	}

	@RequestMapping("/admin/deleteProdutcs")
	public String deleteProducts(Model model, @RequestParam("id") String id,
			@ModelAttribute("ProductsForm") Product product) {
		if (prodao.findById(product.getId()).isEmpty())
			return "redirect:/tables/mnCategory";
		else {
			prodao.deleteById(Long.parseLong(id));
			model.addAttribute("success_category", "Delete success!");
		}
		model.addAttribute("products", prodao.findAll());
		return "tables/mnCategory";
	}

	@RequestMapping("/admin/editProducts")
	public String editProduct(Model model, @RequestParam("id") String id,
			@ModelAttribute("ProductForm") Product product) {
		if (prodao.findById(product.getId()).isEmpty())
			return "redirect:/tables/mnCategory";
		else {
			Product item = prodao.findById(Long.parseLong(id)).get();

//			account.setUsername(item.getUsername());
//			account.setPassword(item.getPassword());
			model.addAttribute("item", item);
		}

		model.addAttribute("products", prodao.findAll());
		return "tables/mnCategory";
	}

	// admin account
	@RequestMapping("/admin/createAccounts")
	public String createAccount(Model model, @Validated @ModelAttribute("AccountsForm") Account account,
			BindingResult result) {
		if (!result.hasErrors()) {
			if (!usdao.findById(account.getUsername()).isEmpty())
				model.addAttribute("error_account", "username already exists");
			else {
				usdao.save(account);
				model.addAttribute("success_account", "Create account success!");
			}
		}
		Account item = new Account();
		model.addAttribute("item", item);
		model.addAttribute("accounts", usdao.findAll());
		return "tables/mnAccount";
	}

	@RequestMapping("/admin/updateAccounts")
	public String updateAccount(Model model, @Validated @ModelAttribute("AccountsForm") Account account,
			BindingResult result) {
		if (!result.hasErrors()) {
			if (usdao.findById(account.getUsername()).isEmpty())
				model.addAttribute("error_account", "username does not exist");
			else {
				usdao.save(account);
				model.addAttribute("success_account", "Update account success!");
			}
		}
		model.addAttribute("accounts", usdao.findAll());
		return "tables/mnAccount";
	}

	@RequestMapping("/admin/deleteAccounts")
	public String deleteAccount(Model model, @RequestParam("username") String username,
			@ModelAttribute("AccountsForm") Account account) {
		if (usdao.findById(account.getUsername()).isEmpty())
			return "redirect:/tables/mnAccount";
		else {
			usdao.deleteById(username);
			model.addAttribute("success_category", "Delete success!");
		}
		model.addAttribute("accounts", usdao.findAll());
		return "tables/mnAccount";
	}

	@RequestMapping("/admin/editAccounts")
	public String category_edit(Model model, @RequestParam("username") String username,
			@ModelAttribute("categoryItem") Account account) {
		if (usdao.findById(account.getUsername()).isEmpty())
			return "redirect:tables/mnAccount";
		else {
			Account item = usdao.findById(username).get();
//			account.setUsername(item.getUsername());
//			account.setPassword(item.getPassword());
			model.addAttribute("item", item);
		}

		model.addAttribute("accounts", usdao.findAll());
		return "tables/mnAccount";
	}

//OrderDetail
	@RequestMapping("/admin/reportOrderDetails")
	public String adminReprortOders(Model model) {
		List<Order> orders = orderDAO.findAll();
		model.addAttribute("orders", orders);

		List<Product> products = prodao.findAll();
		model.addAttribute("products", products);

		List<OrderDetail> orderInfoList = odDAO.findAll();
		model.addAttribute("orderInfoList", orderInfoList);
		return "tables/mnOrder";
	}

	// report OrderDetails
	@RequestMapping("/admin/createOrdeDetails")
	public String createOrderDeatil(Model model,
			@Validated @ModelAttribute("ReportOrderDetails") OrderDetail orderDetail, BindingResult result) {

		odDAO.save(orderDetail);
		model.addAttribute("success_account", "Create account success!");

		OrderDetail item = new OrderDetail();
		model.addAttribute("item", item);
		model.addAttribute("orderInfoList", odDAO.findAll());
		return "tables/mnOrder";
	}

	@RequestMapping("/admin/updateOrderDetails")
	public String updateOrderDetails(Model model,
			@Validated @ModelAttribute("ReportOrderDetail") OrderDetail orderDetail, BindingResult result) {

		odDAO.save(orderDetail);
		model.addAttribute("success_account", "Update account success!");

		model.addAttribute("orderInfoList", odDAO.findAll());
		return "tables/mnOrder";
	}

	@RequestMapping("/admin/deleteOderDetails")
	public String deleteOrderDetails(Model model, @RequestParam("id") String id,
			@ModelAttribute("ReportOrderDetail") OrderDetail orderDetail) {

		odDAO.deleteById(Long.parseLong(id));
		model.addAttribute("success_category", "Delete success!");

		model.addAttribute("orderInfoList", odDAO.findAll());
		return "tables/mnOrder";
	}

	@RequestMapping("/admin/editOderDetails")
	public String editOrderDetails(Model model, @RequestParam("id") String id,
			@ModelAttribute("categoryItem") OrderDetail orderDetail) {
		if (odDAO.findById(orderDetail.getId()).isEmpty())
			return "redirect:tables/mnOrder";
		else {
			OrderDetail item = odDAO.findById(Long.parseLong(id)).get();
//			account.setUsername(item.getUsername());
//			account.setPassword(item.getPassword());
			model.addAttribute("item", item);
		}
		model.addAttribute("orderInfoList", odDAO.findAll());
		return "tables/mnOrder";
	}

	@RequestMapping("/admin/reportByTime")
	public String adminReportImage(Model model) {
		List<Image> images = imageDAO.findAll();
		model.addAttribute("images", images);
		return "/tables/stabyTime";
	}
}
