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

@Controller
public class Product_Controller {
    @Autowired
    private ProductDao dao;

    @GetMapping("/products")
    public String products(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam("field") Optional<String> field) {
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
            Page<Product> page = dao.findAll(pageable);
            model.addAttribute("page", page);
            model.addAttribute("disablePrevious", page.getNumber() == 0);
            model.addAttribute("disableNext", page.getNumber() == page.getTotalPages() - 1);
        } catch (Exception e) {
            // Xử lý lỗi
            e.printStackTrace();
            model.addAttribute("page", null);
        }

        model.addAttribute("sortField", sortField); // Thêm sortField vào model
        return "/user/products";
    }

    @GetMapping("/Men")
    public String men(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam("field") Optional<String> field) {
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
            Page<Product> page = dao.findByNameCategory("nam", pageable);
            model.addAttribute("page", page);
        } catch (Exception e) {
            // Xử lý lỗi
            e.printStackTrace();
            model.addAttribute("page", null);
        }

        model.addAttribute("sortField", sortField);
        return "/user/products";
    }

    @GetMapping("/Women")
    public String women(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam("field") Optional<String> field) {
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
        if (sortField.isEmpty()) {
            model.addAttribute("field", "");
        } else {
            model.addAttribute("field", sortField.substring(0, 1).toUpperCase() + sortField.substring(1));
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
            Page<Product> page = dao.findByNameCategory("nữ", pageable);
            model.addAttribute("page", page);
        } catch (Exception e) {
            // Xử lý lỗi
            e.printStackTrace();
            model.addAttribute("page", null);
        }

        model.addAttribute("sortField", sortField);
        return "/user/products";
    }

    @GetMapping("/Kid")
    public String kid(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam("field") Optional<String> field) {
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
        if (sortField.isEmpty()) {
            model.addAttribute("field", "");
        } else {
            model.addAttribute("field", sortField.substring(0, 1).toUpperCase() + sortField.substring(1));
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
            Page<Product> page = dao.findByNameCategory("trẻ em", pageable);
            model.addAttribute("page", page);
        } catch (Exception e) {
            // Xử lý lỗi
            e.printStackTrace();
            model.addAttribute("page", null);
        }

        model.addAttribute("sortField", sortField);
        return "/user/products";
    }

    @GetMapping("/Accessories")
    public String accessories(Model model, @RequestParam("p") Optional<Integer> p,
            @RequestParam("field") Optional<String> field) {
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
        if (sortField.isEmpty()) {
            model.addAttribute("field", "");
        } else {
            model.addAttribute("field", sortField.substring(0, 1).toUpperCase() + sortField.substring(1));
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
            Page<Product> page = dao.findByNameCategory("Phụ kiện", pageable);
            model.addAttribute("page", page);

        } catch (Exception e) {
            // Xử lý lỗi
            e.printStackTrace();
            model.addAttribute("page", null);
        }

        model.addAttribute("sortField", sortField);
        return "/user/products";
    }
}
