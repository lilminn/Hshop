package com.hoainong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hoainong.service.SessionService;

@Controller
public class LogoutController {
	@Autowired
	SessionService sessionService;
	@GetMapping("/logout")
	public String logout() {
		sessionService.remove("currentUser");
		return "redirect:/login";
	}
}
