package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.ImageDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.ShoppingCartDAO;
import com.poly.entity.Image;
import com.poly.entity.Product;
import com.poly.entity.Session;
import com.poly.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	SessionService service;
	@Autowired
	OrderDAO orderdao;
	@Autowired
	OrderDetailDAO orderdetailsdao;
	@Autowired
	AccountDAO accdao;
	@Autowired
	ProductDAO prodao;
	@Autowired
	ImageDAO imgdao;
	@Autowired
	ShoppingCartDAO shoppingCartDAO;
	@RequestMapping("/index")
	public String indexPage(Model model,@RequestParam("p") Optional<Integer> p) {
		
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = prodao.findAll(pageable);
		model.addAttribute("products",page);
//		List<Product> countPro = prodao.findAll();
//		int maxPage = (int)Math.ceil(countPro.size()/ proMax);
//		model.addAttribute("maxPro",maxPage);
//		List<Product> pros = null;
//		if() {
//			
//		}
		return "/user/index";
	}

	@RequestMapping("/about")
	public String about() {
		return "/user/about";
	}

	@RequestMapping("/nike")
	public String shopNike(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = prodao.findImageNK(pageable);
		model.addAttribute("products",page);
		return "/user/nike";
	}

	@RequestMapping("/mlb")
	public String shopMlb(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = prodao.findImageM(pageable);
		model.addAttribute("products",page);
		return "/user/mlb";
	}

	@RequestMapping("/adidas")
	public String shopAdidas(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = prodao.findImageAD(pageable);
		model.addAttribute("products",page);
		return "/user/adidas";
	}
    @RequestMapping("/detail/{id}")
    public String productDetail(Model model, @PathVariable("id") Long id) {
    	Product product = prodao.findById(id).get();
//    	Image img = imgdao.findById(id).get();
    	model.addAttribute("item",product);
    	model.addAttribute("cartItems", shoppingCartDAO.getAll());
		model.addAttribute("total", shoppingCartDAO.getAmount());
		service.setAttribute("cartQuantity", shoppingCartDAO.getCount());
//        model.addAttribute("img",img);
    	return "/user/trangchitiet";
    }
	@RequestMapping("/contact")
	public String contact() {
		return "/user/contact";
	}
	@RequestMapping("/sort")
	public String sort(Model model, @RequestParam("field") Optional<String> field,@RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").substring(0, 1).toUpperCase() + field.orElse("price").substring(1, field.orElse("price").length()));
		model.addAttribute("sort", sort);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = prodao.findImageNK(pageable);
		model.addAttribute("products",page);
		return "/user/nike";
	}
	@RequestMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("cartItems", shoppingCartDAO.getAll());
		model.addAttribute("total", shoppingCartDAO.getAmount());
		service.setAttribute("cartQuantity", shoppingCartDAO.getCount());
		return "/user/cart";
	}
	@GetMapping("/add/{id}")
	public String addCart(@PathVariable("id") long id,Model model) {
	   
	   if(service.getAttribute("user") == null){
		   model.addAttribute("mess","Please login before buying");
		   return"redirect:/index";
	   }
		model.addAttribute("cartItems", shoppingCartDAO.getAll());
		Optional<Product> product = prodao.findById(id);
		Product item = new Product();
		BeanUtils.copyProperties(product.get(), item);
		item.setQuantity(1);
		shoppingCartDAO.add(item);
		service.setAttribute("cartQuantity", shoppingCartDAO.getCount());
		return "redirect:/index";
	}
	@GetMapping("/addtoCart/{id}")
	public String addtoCart(@PathVariable("id") long id,Model model) {
		model.addAttribute("cartItems", shoppingCartDAO.getAll());
		Optional<Product> product = prodao.findById(id);
		Product item = new Product();
		BeanUtils.copyProperties(product.get(), item);
		item.setQuantity(1);
		shoppingCartDAO.add(item);
		service.setAttribute("cartQuantity", shoppingCartDAO.getCount());
		return "redirect:/cart";
	}
	@GetMapping("/remove/{id}")
	public String removeCart(@PathVariable("id") long id) {
		shoppingCartDAO.remove(id);
		return "redirect:/cart";
	}
	@PostMapping("/update")
	public String updateCart(@RequestParam("id") long id, @RequestParam("quantity") int quantity) {
		shoppingCartDAO.update(id, quantity);
		service.setAttribute("cartQuantity", shoppingCartDAO.getCount());
		return "redirect:/cart";
	}
	@RequestMapping("/cart/cong/{id}")
	public String cong(@PathVariable("id") long id) {
		Optional<Product> product = prodao.findById(id);
		Product item = new Product();
		BeanUtils.copyProperties(product.get(), item);
		item.setQuantity(1);
		shoppingCartDAO.add(item);
		return "redirect:/cart";
	}
	@RequestMapping("/cart/tru/{id}")
	public String tru(@PathVariable("id") long id) {
		Optional<Product> product = prodao.findById(id);
		Product item = new Product();
		BeanUtils.copyProperties(product.get(), item);
		item.setQuantity(-1);
		if(product.get().getQuantity() <= 0) {
			shoppingCartDAO.remove(id);
		}
		shoppingCartDAO.add(item);
		return "redirect:/cart";
	}
	@GetMapping("/clear")
	public String clearCart() {
		shoppingCartDAO.clear();
		return "/user/cart";
	}
	@GetMapping("/checkout")
	public String checkout() {
		shoppingCartDAO.clear();
		return "/user/checkout";
	}

//	@RequestMapping("/login")
//	public String login() {
//		return "/user/login";
//	}
    
	@RequestMapping("/signup")
	public String signup() {
		return "/user/signup";
	}

	@RequestMapping("/forget-password")
	public String forgetPassword() {
		return "/user/forget-password";
	}
}
