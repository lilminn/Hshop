package com.hoainong.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoainong.model.User;
import com.hoainong.repository.UserDao;
import com.hoainong.service.UserService;

@Controller
public class ForgotPassword {
	@Autowired
    public JavaMailSender emailSender;
	@Autowired
	private UserService userService;
	@Autowired
	UserDao dao;
	@GetMapping("/fogotPassword")
	public String showForgotPasswordPage(Model model) {
	    model.addAttribute("user", new User());
	    return "user/forgot_password";
	}
	@PostMapping("/fogotPassword/submit")
	public String submitForgot(@RequestParam("email") String email,RedirectAttributes redirectAttributes) {
	    User user = userService.findUserByEmail(email);
	    if (user != null) {
	        try {
	            SimpleMailMessage mailMessage = new SimpleMailMessage();
	            mailMessage.setTo(user.getEmail());
	            mailMessage.setFrom("HSHOP_NNH");
	            mailMessage.setSubject("RESET PASSWORD");
	            user.setPassword("9999");
	            mailMessage.setText("Hello, Password new:" + user.getPassword());
	            emailSender.send(mailMessage);
	            try {
	            	 dao.save(user);
				} catch (Exception e) {
					// TODO: handle exception
				}
	            return "redirect:/login";
	        } catch (Exception e) {
	        	 redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
	        }
	    }
	    redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
	    return "redirect:/fogotPassword";
	}

	
	
}
