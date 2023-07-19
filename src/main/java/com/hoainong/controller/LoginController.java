package com.hoainong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoainong.model.User;
import com.hoainong.service.CookieService;
import com.hoainong.service.ParamService;
import com.hoainong.service.SessionService;
import com.hoainong.service.UserService;

import jakarta.validation.Valid;

@Controller
public class LoginController {
	@Autowired
	SessionService session;
	@Autowired
	UserService userService;
	@Autowired
	ParamService paramService;
	@Autowired
	CookieService cookieService;

	@GetMapping("/login")
	public String showLoginForm(Model model,
			@ModelAttribute("email") String email,
			@ModelAttribute("password") String password) {
		if (!model.containsAttribute("user")) {
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			model.addAttribute("user", user);
		}
		
		model.addAttribute("email", cookieService.getCookie("email"));
		model.addAttribute("password", cookieService.getCookie("password"));
		return "/user/login";
	}
	@PostMapping("/login/submit")
	public String postLogin(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
	    boolean remember = paramService.getBoolean("remember", false);

	    User user2 = userService.login(user.getEmail(), user.getPassword());
	    if (user2 != null) {
	        session.set("currentUser", user2);
	        if (remember) {
	            cookieService.addCookie("email", user2.getEmail(), 1);
	            cookieService.addCookie("password", user2.getPassword(), 1);
	        } else {
	            cookieService.removeCookie("username");
	            cookieService.removeCookie("password");
	        }
	        redirectAttributes.addFlashAttribute("successMessage", "User login successfully!");
	        return "redirect:/index";
	    }

	    // Kiểm tra email và mật khẩu không đúng
	    redirectAttributes.addFlashAttribute("errorMessage", "Invalid email or password.");
	    redirectAttributes.addFlashAttribute("user", user);
	    return "redirect:/login";
	}


}
