package com.hoainong.controller;

import com.hoainong.model.User;
//import com.hoainong.service.UserService;
import com.hoainong.repository.UserDao;
import com.hoainong.service.UserService;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {
	@Autowired
	 private UserDao dao;
	@Autowired
	private UserService userService;
	@Autowired
    public JavaMailSender emailSender;
	
	@GetMapping("/register")
	public String register(Model model) {
		User user = new User(); 
		model.addAttribute("user", user); 
		return "/user/register";
	}
	
	@PostMapping("/register/save")
	public String saveUser(@Valid @ModelAttribute("user") User user,
			BindingResult bindingResult, Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam("comfirmpass") String comfirmpass) {
		
		if (bindingResult.hasErrors()){
			model.addAttribute("errorMessage",
					"Invalid date format. Please use dd/MM/yyyy");
			return "/user/register";
		}
		if(!user.getPassword().equals(comfirmpass)) {
			 bindingResult.rejectValue("password", "errorPass", "password fail");
			return "/user/register";
		}
		if (userService.existsByEmail(user.getEmail())) {
	        bindingResult.rejectValue("email", "errorDuplicateEmail", "Email already exists");
	        return "/user/register";
	    }

	    if (userService.existsByPhone(user.getPhone())) {
	        bindingResult.rejectValue("phone", "errorDuplicatePhone", "Phone number already exists");
	        return "/user/register";
	    }
		try {
			dao.save(user);
			SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(user.getEmail());
            mailMessage.setFrom("HSHOP_NNH");
            mailMessage.setSubject("CHÚC MỪNG KHÁCH HÀNG MỚI");
            mailMessage.setText("Hello, welcome " + user.getFullName() +" to Hshop");
            emailSender.send(mailMessage);
		    redirectAttributes.addFlashAttribute("email", user.getEmail());
			redirectAttributes.addFlashAttribute("password", user.getPassword());
		    redirectAttributes.addFlashAttribute("successMessage", "User registered successfully!");
		    return "redirect:/login";
		} catch (Exception e) {
		    return "/user/register";
		}
		
	}

}
