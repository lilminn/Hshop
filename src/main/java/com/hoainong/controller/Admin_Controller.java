package com.hoainong.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoainong.model.Brand;
import com.hoainong.model.Category;
import com.hoainong.model.InvoiceDetail;
import com.hoainong.model.InvoiceStats;
import com.hoainong.model.Product;
import com.hoainong.model.User;
import com.hoainong.repository.InvoiceDao;
import com.hoainong.repository.InvoiceDetailDao;
import com.hoainong.repository.ProductDao;
import com.hoainong.repository.UserDao;
import com.hoainong.service.SessionService;


@Controller
public class Admin_Controller {
	@Autowired
	UserDao userDao;
	@Autowired
	SessionService session;
	@Autowired
	ProductDao productDao;
	@Autowired
	InvoiceDetailDao detatilDao;
	
	@RequestMapping("/admin")
	public String index(Model model,
			RedirectAttributes redirectAttributes) {
		
		User user = session.get("currentUser");
		if(user != null && user.getAdmin()==true){
			model.addAttribute("user", userDao.findAll());
			return "admin/index";
		}
			return "redirect:/login";	
	}
	@GetMapping("/admin/user/edit/{userId}")
	public String userEdit(Model model, @PathVariable("userId")  Integer UserID) {
		if(userDao.findById(UserID) == null) {
			return "redirect:/admin/user/edit";
		}else {
			User user = userDao.findById(UserID).get();  
			model.addAttribute("users", user);
			
		}
		model.addAttribute("user", userDao.findAll());
		return "admin/index";
	}
	@PostMapping("/admin/user/insert")
	public String userInsert( Model model,@Validated @ModelAttribute("user") User u,BindingResult result,
					 @RequestParam("name") String fullName,
					@RequestParam("password") String password, @RequestParam("email") String email,
					@RequestParam("address") String address, @RequestParam("phone") String phone) {
		if(!userDao.findById(u.getUserID()).isEmpty())
			model.addAttribute("error_category", "Id đã tồn tại!");
		else {
			
			
//			u.setPassword(password);
//			u.setEmail(email);
//			u.setAddress(address);
//			u.setPhone(phone);
			u.setUserID(100);
			u.setFullName(fullName);
			u.setActive(false);
			u.setAdmin(false);
			u.setPhoto(null);
			userDao.save(u);
			//model.addAttribute("success_category", "Create success!");
		}
	
	model.addAttribute("user", userDao.findAll());
	return "admin/index";
	}
	@PostMapping("/admin/user/delete/{userId}")
	public String userDelete(Model model,@RequestParam("userId") int UserId, @PathVariable("userId")  Integer UserID) {
		if(userDao.findById(UserID) == null) {
				return "admin/product";
			}	else {
				userDao.deleteById(UserId);
			
			}
		model.addAttribute("user", userDao.findAll());
		return "redirect:/admin";
	}
	@PostMapping("/admin/user/update")
	public String userUpdate(Model model,@RequestParam("userId") int UserId,@RequestParam("name") String fullName, @ModelAttribute("user") User u) {
			if(userDao.findById(u.getUserID()).isEmpty()) {
				return "admin/product";
			}	else {
				u.setActive(false);
				u.setAdmin(false);
				u.setPhoto(null);
				userDao.save(u);				
			}
		model.addAttribute("user", userDao.findAll());
		return "admin/index";
	}
	@PostMapping("/admin/user/search")
	public String userSearch(Model model,@RequestParam("key") Optional<String> kw, @ModelAttribute("user") User u) {
		String keyWord = kw.orElse(session.get("key", ""));
		List<User> user = userDao.findUserByKey("%"+keyWord+"%");
		model.addAttribute("user", user);
		return "admin/index";
	}
	@GetMapping("/admin/product")
	public String products(Model model, @ModelAttribute("allProduct") Product pro,
			@RequestParam("p") Optional<Integer> p) {
		pro.setProductID(null);
		pro.setName(null);
		pro.setPrice(null);
		pro.setBrand(null);
		pro.setAvailable(null);
		pro.setCategory(null);
		pro.setInvoiceDetails(null);
		pro.setDescription(null);
		pro.setGalleries(null);
		
		
		model.addAttribute("allProducts", productDao.findAll());
		return "/admin/products";
	}

//	@GetMapping("/admin/product/edit-product")
//	public String editProductadmin(Model model, @RequestParam("id") Integer id,
//			@ModelAttribute("allproducts") Product pro) {
//		if (dao.findById(pro.getProductID()).isEmpty())
//			return "redirect:/category/index";
//		else {
//			Optional<Product> category = dao.findById(id);
//			pro.setProductID(category.get().getProductID());
//			pro.setName(category.get().getName());
//		}
//		model.addAttribute("allProducts", dao.findAll());
//
//		return "admin/products";
//	}
	@GetMapping("/admin/product/edit-product")
	public String editProductAdmin(Model model ,@RequestParam("id") Integer id, @ModelAttribute("product") Product p) {
	    Optional<Product> productOptional = productDao.findById(id);
	    if (productOptional.isEmpty())
	        return "redirect:/admin";

	    Product product = productOptional.get();
	    model.addAttribute("product", product);
	    model.addAttribute("allProducts", productDao.findAll());

	    return "admin/edit-product";
	}

	@GetMapping("/admin/product/add-product")
	public String addProductadmin() {
		
		return "admin/add-product";
	}
	@PostMapping("/admin/product/add-product")
	public String addProductadminp(Model model,@ModelAttribute("product") Product p, 
			@RequestParam("productName") String name,@RequestParam("categoryID") Category categoryID,
			@RequestParam("brandID") Brand brandID, @RequestParam("image") String image) {
		//String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		//String filename=file.getOriginalFilename();
		if(!productDao.findById(p.getProductID()).isEmpty())
			model.addAttribute("error_category", "Id đã tồn tại!");
		else {
			p.setBrand(brandID);
			p.setCategory(categoryID);
			p.setName(name);
			p.setImage("/templates/user/images/Men/"+ image);
			p.setAvailable(true);
			productDao.save(p);
			//model.addAttribute("filename",filename);
			return "redirect:/admin/product";
		}
	
		model.addAttribute("user", userDao.findAll());
		return "admin/add-product";
	}
	@PostMapping("/admin/product/delete")
	public String deleteProductadminp(Model model,@ModelAttribute("product") Product p, 
			@RequestParam("productID") Integer productID) {
		if(productDao.findById(productID).isEmpty())
			model.addAttribute("error_category", "Id đã tồn tại!");
		else {			
			productDao.delete(p);
			return "redirect:/admin/product";
		}
	
		model.addAttribute("user", userDao.findAll());
		return "admin/add-product";
	}
	@PostMapping("/admin/product/update")
	public String updateProductadmin(Model model,@ModelAttribute("product") Product p, 
			@RequestParam("productName") String name,@RequestParam("categoryID") Category categoryID,
			@RequestParam("brandID") Brand brandID, @RequestParam("image") String image) {
		if(productDao.findById(p.getProductID()).isEmpty())
			model.addAttribute("error_category", "Id đã tồn tại!");
		else {
			p.setBrand(brandID);
			p.setCategory(categoryID);
			p.setName(name);
			p.setImage(image);
			p.setAvailable(true);
			productDao.save(p);
			return "redirect:/admin/product";
		}
	
		model.addAttribute("user", userDao.findAll());
		return "admin/add-product";
	}
	@GetMapping("/admin/statistical")
	public String statistical(Model model) {
		List<Object[]> results = detatilDao.getInvoiceStats();
        List<InvoiceStats> invoiceStatsList = new ArrayList<>();

        for (Object[] row : results) {
            Integer year = (Integer) row[0];
            Integer month = (Integer) row[1];
            Double totalAmount = (Double) row[2];

            InvoiceStats invoiceStats = new InvoiceStats(year, month, totalAmount);
            invoiceStatsList.add(invoiceStats);
        }

        model.addAttribute("stats", invoiceStatsList);
		return "admin/statistical";
	}
	@GetMapping("/admin/login")
	public String login() {
		return "admin/login";
	}
	@GetMapping("/admin/sigh-up")
	public String sighup() {
		return "admin/sigh-up";
	}
}