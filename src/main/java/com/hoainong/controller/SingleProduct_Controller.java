package com.hoainong.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoainong.model.InvoiceDetail;
import com.hoainong.model.Product;
import com.hoainong.repository.InvoiceDetailDao;
import com.hoainong.repository.ProductDao;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SingleProduct_Controller {
	@Autowired
	HttpServletRequest req;
	@Autowired
	ProductDao dao;
	@Autowired
	InvoiceDetailDao invoiceDetailDao;
	
	@GetMapping("/single-product/{productID}")
	public String singleProduct(@PathVariable("productID") Integer id, Model model) {
		Optional<Product> p = dao.findById(id);
		model.addAttribute("tinhthongminh", p.get());
		List<InvoiceDetail> listDetailz = invoiceDetailDao.findInvoiceDetailsByInvoiceId(2);
		int n = listDetailz.size();
		model.addAttribute("n", n);
		return "/user/single-product";
	}

	
}
