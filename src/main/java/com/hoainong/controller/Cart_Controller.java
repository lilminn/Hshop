package com.hoainong.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoainong.model.Invoice;
import com.hoainong.model.InvoiceDetail;
import com.hoainong.model.Product;
import com.hoainong.model.Statistical;
import com.hoainong.model.User;
import com.hoainong.repository.InvoiceDao;
import com.hoainong.repository.InvoiceDetailDao;
import com.hoainong.repository.ProductDao;
import com.hoainong.repository.StatisticalDao;
import com.hoainong.repository.UserDao;
import com.hoainong.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Cart_Controller {
	@Autowired
	InvoiceDetailDao invoiceDetailDAO;
	@Autowired
	InvoiceDao invoiceDAO;
	@Autowired
	ProductDao dao;
	@Autowired
	UserDao userDao;
	@Autowired
	StatisticalDao statisticalDao;
	@Autowired
	SessionService service;
	@RequestMapping("/cart")
	public String cart(HttpServletRequest req, Model model) {
		
		User user = service.get("currentUser");
		if(user!=null) {
			System.out.println(user.getUserID());
			List<Invoice> invoice = invoiceDAO.findInvoicesByUserId(user.getUserID());
			
			List<InvoiceDetail> listDetailz = invoiceDetailDAO
					.findInvoiceDetailsByInvoiceId(invoice.get(0).getInvoiceID());
			int n = listDetailz.size();
			model.addAttribute("n", n);
			List<Invoice> list = invoiceDAO.findInvoicesByUserId(user.getUserID());
			Integer invoiceId = list.get(0).getInvoiceID();
			List<InvoiceDetail> listDetail = invoiceDetailDAO
					.findInvoiceDetailsByInvoiceId(invoiceId);
			Double sum = 0.0;
			for (InvoiceDetail i : listDetail) {
				sum += i.getTotal();
			}
			model.addAttribute("sum", sum);
			model.addAttribute("listProduct", listDetail);

			return "/user/cart";
		}else {
			return "redirect:/login";
		}
		
	}

	@RequestMapping("/single-productz/{id}")
	public String cart(@PathVariable("id") Integer id, HttpServletRequest req,
			Model model) {
		// Integer idz = Integer.parseInt(req.getParameter("userz"));
		User user = service.get("currentUser");
		Product p = dao.findById(id).get();
		List<Invoice> list = invoiceDAO.findInvoicesByUserId(user.getUserID());
		Integer invoiceId = list.get(0).getInvoiceID();
		List<InvoiceDetail> listDetail = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int check = 0;
		Double price = 0.0;
		for (InvoiceDetail i : listDetail) {
			if (i.getProduct().getProductID() == id) {
				check = 1;
				price = price + ((i.getQuantity() + 1) * i.getPrice());
				invoiceDetailDAO.updateQuantity(i.getQuantity() + 1, price,
						i.getProduct().getProductID(), invoiceId);
			}
		}
		if (check == 0) {
			InvoiceDetail invoiceDetail = new InvoiceDetail();
			invoiceDetail.setInvoice(list.get(0));
			invoiceDetail.setProduct(p);
			invoiceDetail.setPrice(600000.0);
			invoiceDetail.setQuantity(1);
			invoiceDetail.setTotal(600000.0);
			invoiceDetailDAO.save(invoiceDetail);
		}
		List<InvoiceDetail> listDetailz = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int n = listDetailz.size();
		model.addAttribute("n", n);
		Double sum = 0.0;
		for (InvoiceDetail i : listDetailz) {
			sum += i.getTotal();
		}
		model.addAttribute("sum", sum);

		return "redirect:/single-product/{id}";
	}

	@RequestMapping("/remove/cart/{id}")
	public String removeCart(@PathVariable("id") Integer id, Model model) {
		invoiceDetailDAO.deleteById(id);
		User user = service.get("currentUser");
		List<Invoice> list = invoiceDAO.findInvoicesByUserId(user.getUserID());
		List<InvoiceDetail> listDetailz = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(list.get(0).getInvoiceID());
		model.addAttribute("listProduct", listDetailz);
		int n = listDetailz.size();
		model.addAttribute("n", n);
		Double sum = 0.0;
		for (InvoiceDetail i : listDetailz) {
			sum += i.getTotal();
		}
		model.addAttribute("sum", sum);
		return "redirect:/cart";
	}

	@RequestMapping("/user/pay")
	public String pay(@RequestParam("total") Double total, Model model) {
		User userz = service.get("currentUser");
		Statistical n = new Statistical();
		Optional<User> user = userDao.findById(userz.getUserID());
		n.setUser(user.get());

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		n.setDateCreat(date);
		n.setTotal(total);
		statisticalDao.save(n);

		return "/user/pay";

	}
//
//	@RequestMapping("/mailer/demo")
//	public String demo(Model model) {
//		MailServiceImpl mailer = new MailServiceImpl();
//		try {
//			mailer.queue("tinhkun56@gmail.com",
//					"Báº¡n Ä‘Ã£ Ä‘áº·t hÃ ng thÃ nh cÃ´ng",
//					"Cáº£m mÆ¡n báº¡n Ä‘Ã£ sá»­ dá»¥ng dá»‹ch vá»¥ cá»§a chÃºng tÃ´i");
//
//		} catch (Exception e) {
//			return e.getMessage();
//		}
//		return "/user/products";
//	}
//
	@RequestMapping("/single-productzz/{id}")
	public String plus(@PathVariable("id") Integer id, HttpServletRequest req,
			Model model) {
		// Integer idz = Integer.parseInt(req.getParameter("userz"));
		User user = service.get("currentUser");
		Product p = dao.findById(id).get();
		List<Invoice> list = invoiceDAO.findInvoicesByUserId(user.getUserID());
		Integer invoiceId = list.get(0).getInvoiceID();
		List<InvoiceDetail> listDetail = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int check = 0;
		Double price = 0.0;
		for (InvoiceDetail i : listDetail) {
			if (i.getProduct().getProductID() == id) {
				price = price + ((i.getQuantity() + 1) * i.getPrice());
				invoiceDetailDAO.updateQuantity(i.getQuantity() + 1, price,
						i.getProduct().getProductID(), invoiceId);
			}
		}

		List<InvoiceDetail> listDetailz = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int n = listDetailz.size();
		model.addAttribute("n", n);
		Double sum = 0.0;
		for (InvoiceDetail i : listDetailz) {
			sum += i.getTotal();
		}
		model.addAttribute("sum", sum);

		return "redirect:/cart";
	}

	@RequestMapping("/single-productzzz/{id}")
	public String minus(@PathVariable("id") Integer id,
			@RequestParam("emty") Integer emty, HttpServletRequest req,
			Model model) {
		// Integer idz = Integer.parseInt(req.getParameter("userz"));
		User user = service.get("currentUser");
		Product p = dao.findById(id).get();
		List<Invoice> list = invoiceDAO.findInvoicesByUserId(user.getUserID());
		Integer invoiceId = list.get(0).getInvoiceID();
		List<InvoiceDetail> listDetail = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int check = 0;
		Double price = 0.0;
		for (InvoiceDetail i : listDetail) {
			if (i.getProduct().getProductID() == id) {
				if (i.getQuantity() == 1) {
					check = 1;
					price = price - i.getPrice();
					invoiceDetailDAO.deleteById(emty);
				}
				if (check == 0) {
					price = price + ((i.getQuantity() - 1) * i.getPrice());
					invoiceDetailDAO.updateQuantity(i.getQuantity() - 1, price,
							i.getProduct().getProductID(), invoiceId);
				}

			}
			
		}

		List<InvoiceDetail> listDetailz = invoiceDetailDAO
				.findInvoiceDetailsByInvoiceId(invoiceId);
		int n = listDetailz.size();
		model.addAttribute("n", n);
		Double sum = 0.0;
		for (InvoiceDetail i : listDetailz) {
			sum += i.getTotal();
		}
		model.addAttribute("sum", sum);

		return "redirect:/cart";
	}
}
