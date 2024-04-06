package com.jspiders.spring_mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.spring_mvc.dto.UserDTO;
import com.jspiders.spring_mvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(path = "/sign_up", method = RequestMethod.GET)
	public String signUpPage() {
		return "sign_up";
	}
	
	@RequestMapping(path = "/add_user", method = RequestMethod.POST)
	public String addUser( @RequestParam(name = "email") String email, 
			@RequestParam(name = "password") String password, ModelMap modelMap) {
		UserDTO addedUser = userService.addUser(email, password);
		if(addedUser != null) {
			modelMap.addAttribute("message", "Signed_Up");
			return "sign_in";
		} else {
			modelMap.addAttribute("message", "Email_Id_already_exists.");
			return "sign_up";
		}
	}
	
	@RequestMapping(path = "/sign_in", method = RequestMethod.GET)
	public String signInPage() {
		return "sign_in";
	}
	
	@RequestMapping(path = "/check_user", method = RequestMethod.POST)
	public String signInUser(@RequestParam(name = "email") String email, 
			@RequestParam(name = "password") String password, ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = userService.signInUser(email, password);
		httpSession.setAttribute("user", signInUser);
//		Using setMaxInactiveInterval(600) we can set sign out time interval in seconds
//		httpSession.setMaxInactiveInterval(600);
		if(signInUser != null) {
			modelMap.addAttribute("message", "Signed_In");
			return "home_page";
		}
		else {
			modelMap.addAttribute("message", "Invalid_Email_&_Password!!!");
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/home_page", method = RequestMethod.GET)
	public String getHomePage(ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if(signInUser != null) {
			return "home_page";
		}
		else {
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/sign_out", method = RequestMethod.GET)
	public String signOut(ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if(signInUser != null) {
			modelMap.addAttribute("message", "Signed_out");
			httpSession.invalidate();
		}
		return "sign_in";
	}
	
	@RequestMapping(path = "/delete_user", method = RequestMethod.GET)
	public String deleteUser(ModelMap modelMap, HttpSession httpSession) {
		UserDTO signedInUser = (UserDTO) httpSession.getAttribute("user");
		if(signedInUser != null) {
			userService.deleteUser(signedInUser);
			modelMap.addAttribute("message", "User_deletedn.");
		}
		return "sign_in";
	}

}
