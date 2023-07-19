package com.hoainong.controller;



import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoainong.model.Product;
import com.hoainong.repository.ProductDao;

@Controller
public class Home_Controller {
	@Autowired
	ProductDao dao;
	
	@RequestMapping("/")
	public String hackShope(Model model) {
		List<Product> menproducts = dao.findByNameCategory("nam");
		Collections.shuffle(menproducts);
		List<Product> womenproducts = dao.findByNameCategory("nữ");
		Collections.shuffle(womenproducts);
		List<Product> kidproducts = dao.findByNameCategory("trẻ em");
		Collections.shuffle(kidproducts);
		model.addAttribute("menproducts", menproducts);
		model.addAttribute("womenproducts", womenproducts);
		model.addAttribute("kidproducts", kidproducts);
		return "/user/index";
	}
	@GetMapping("/index")
	public String index(Model model) {
		List<Product> menproducts = dao.findByNameCategory("nam");
		Collections.shuffle(menproducts);
		List<Product> womenproducts = dao.findByNameCategory("nữ");
		Collections.shuffle(womenproducts);
		List<Product> kidproducts = dao.findByNameCategory("trẻ em");
		Collections.shuffle(kidproducts);
		model.addAttribute("menproducts", menproducts);
		model.addAttribute("womenproducts", womenproducts);
		model.addAttribute("kidproducts", kidproducts);
		return "/user/index";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "/user//contact";
	}
	@GetMapping("/about")
	public String about() {
		return "/user/about";
	}



	
}
