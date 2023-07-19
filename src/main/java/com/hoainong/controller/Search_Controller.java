package com.hoainong.controller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hoainong.model.Product;
import com.hoainong.repository.ProductDao;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Search_Controller {

	@Autowired
	ProductDao dao;

	@Autowired
	HttpServletRequest request;
	
	@GetMapping("/search")
	public String search(Model model, 
			@RequestParam("keyword") String keyword,
			@RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) {
			String requestURI = request.getRequestURI(); 
			boolean checkUri = false;
			if(requestURI.contains("/search")) {
				checkUri = true;
				model.addAttribute("uri", checkUri);
				model.addAttribute("keyword", keyword);
			}else {
				model.addAttribute("uri", checkUri);
			}
			
			Sort sort;
	        String sortField = field.orElse("name");
	        switch (sortField) {
	            case "name":
	                sort = Sort.by(Direction.ASC, "name");
	                break;
	            case "price":
	                sort = Sort.by(Direction.ASC, "price");
	                break;
	            default:
	                sort = Sort.by(Direction.ASC, "name");
	                break;
	        }
	        int currentPage = p.orElse(0);
	        int totalProducts = (int) dao.count(); // Đếm tổng số lượng sản phẩm
	        int totalPages = (int) Math.ceil((double) totalProducts / 9);
	        if (currentPage == -1) {
	            currentPage = 0; // Thay k bằng giá trị bạn muốn đặt
	        } else if (currentPage >= totalPages) {
	            currentPage = totalPages - 1;
	        }
	        Pageable pageable = PageRequest.of(currentPage, 9, sort);
	        try {
	            Page<Product> page = dao.findByNameCategory(keyword, pageable);
	            model.addAttribute("page", page);
	        } catch (Exception e) {
	            // Xử lý lỗi
	            e.printStackTrace();
	            model.addAttribute("page", null);
	        }
	        System.out.println("Keyword: " + requestURI);
	        model.addAttribute("sortField", sortField);
	        return "/user/products";
	}


}
