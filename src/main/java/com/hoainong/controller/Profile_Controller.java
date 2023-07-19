package com.hoainong.controller;

import java.io.File;
import java.util.List;

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

import com.hoainong.model.User;
import com.hoainong.repository.UserDao;
import com.hoainong.service.ParamService;
import com.hoainong.service.SessionService;
import com.hoainong.service.UserService;

import jakarta.validation.Valid;

@Controller
public class Profile_Controller {
	@Autowired
	private UserDao dao;
	@Autowired
	private UserService userService;
	@Autowired
	public JavaMailSender emailSender;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;

	@GetMapping("/settingProfile")
	public String settingProfile(Model model) {
		User user = session.get("currentUser");		
			model.addAttribute("user", user);
			
		return "/user/settingProfile";
//		}else {
//			return "redirect:/login";
//		}

	}

	@PostMapping("/settingProfile/save")
	public String userUpdate(Model model, @ModelAttribute("user") User u) {
	    User user = session.get("currentUser");
	    try {
	        Integer id = user.getUserID();
	        user.setEmail(u.getEmail());
	        user.setFullName(u.getFullName());
	        user.setPhone(u.getPhone());
	        user.setBirthday(u.getBirthday());
	        List<User> lstu = dao.findAll();
	        for (User user2 : lstu) {
	            if (user2.getUserID().equals(id)) {
	                System.out.println(user.getUserID());
	                try {
	                    dao.updateUserProfile(user.getEmail(), user.getFullName(),
	                    		user.getPhone(), user.getBirthday(), user.getUserID());
	                } catch (Exception e) {
	                    // TODO: handle exception
	                }
	                return "redirect:/settingProfile";
	            }
	        }
	    } catch (Exception e) {
	        // TODO: handle exception
	    }
	    return "redirect:/settingProfile";
	}

//	@PostMapping("/settingProfile/upload")
//	public String uploadFile(@Valid @ModelAttribute("user") User user,
//			BindingResult result, Model model,
//			@RequestParam("chooseimg") MultipartFile img) {
//		
//		if (result.hasErrors()) {
//            return "/user/settingProfile";
//        } else {
//            if (!img.isEmpty()) {
//                String fileName = img.getOriginalFilename();
//                File file = new File(app.getRealPath("/img/" + fileName));
//                img.transferTo(file);
//                model.addAttribute("upload", fileName);
//            }
//            model.addAttribute("message", "All fields are valid^^");
//            model.addAttribute("sv", student);
//            return "show";
//        }
//		return "redirect:/settingProfile";
//	}
}
