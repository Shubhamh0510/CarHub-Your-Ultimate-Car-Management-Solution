package com.jspiders.spring_mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.spring_mvc.dto.CarDTO;
import com.jspiders.spring_mvc.dto.UserDTO;
import com.jspiders.spring_mvc.service.CarService;
import com.jspiders.spring_mvc.service.UserService;

@Controller
public class CarController {

	@Autowired
	private CarService carService;

	@Autowired
	private UserService userService;

	@RequestMapping(path = "/add_page", method = RequestMethod.GET)
	public String getAddPage(HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			return "add_car";
		} else {
			return "sign_in";
		}
	}

	@RequestMapping(path = "/add_car", method = RequestMethod.POST)
	public String addCar(@RequestParam(name = "model") String model, @RequestParam(name = "name") String name,
			@RequestParam(name = "brand") String brand, @RequestParam(name = "fueltype") String fueltype, 
			@RequestParam(name = "color") String color, @RequestParam(name = "price") double price, 
			ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			CarDTO addedCar = carService.addCar(model, name, brand, fueltype, color, price);
//			Mapping Done!
			userService.updateUserCar(signInUser, addedCar);
			modelMap.addAttribute("message", "Car_Details_Added.");
			List<CarDTO> cars = carService.myCar(signInUser);
			if (cars != null) {
				modelMap.addAttribute("cars", cars);
			} else {
				modelMap.addAttribute("message", "Cars_Not_Available!!n!");
			}
			return "my_car";
		} else {
			return "sign_in";
		}
	}

	@RequestMapping(path = "/all_car", method = RequestMethod.GET)
	public String allCar(ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			List<CarDTO> cars = carService.allCar();
			if (cars != null) {
				modelMap.addAttribute("cars", cars);
			} else {
				modelMap.addAttribute("message", "Cars_Not_Available!!!");
			}
			return "all_car";
		} else {
			return "sign_in";
		}
	}

	@RequestMapping(path = "/my_car", method = RequestMethod.GET)
	public String myCar(ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			List<CarDTO> cars = carService.myCar(signInUser);
			if (cars != null) {
				modelMap.addAttribute("cars", cars);
			} else {
				modelMap.addAttribute("message", "Cars_Not_Available!!!");
			}
			return "my_car";
		} else {
			return "sign_in";
		}
	}

	@RequestMapping(path = "/view_mycar", method = RequestMethod.POST)
	public String getViewPage(@RequestParam(name = "id") int id, HttpSession httpSession, ModelMap modelMap) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		CarDTO car = carService.getViewPage(id);
		if (signInUser != null) {
			if (car != null) {
				modelMap.addAttribute("car", car);
			} else {
				modelMap.addAttribute("message", "Cars_Details_Not_Available!!!");
			}
			return "view_mycar";
		} else {
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/view_allcar", method = RequestMethod.POST)
	public String getViewAllCarPage(@RequestParam(name = "id") int id, HttpSession httpSession, ModelMap modelMap) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		CarDTO car = carService.getViewPage(id);
		if (signInUser != null) {
			if (car != null) {
				modelMap.addAttribute("car", car);
			} else {
				modelMap.addAttribute("message", "Cars_Details_Not_Available!!!");
			}
			return "view_allcar";
		} else {
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/edit_car", method = RequestMethod.POST)
	public String getEditCar( @RequestParam(name = "id")int carId, ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			CarDTO car = carService.getEditCar(carId, signInUser.getId());
			modelMap.addAttribute("car", car);
			return "edit_car";
		} else {
			return "sign_in";
		}		
	}
	
	@RequestMapping(path = "/update_car", method = RequestMethod.POST)
	public String updateCar(@RequestParam(name = "id") int id, @RequestParam(name = "model") String model, 
			@RequestParam(name = "name") String name, @RequestParam(name = "brand") String brand, 
			@RequestParam(name = "fueltype") String fueltype, @RequestParam(name = "color") String color, 
			@RequestParam(name = "price") double price, ModelMap modelMap, HttpSession httpSession) {
		UserDTO signInUser = (UserDTO) httpSession.getAttribute("user");
		if (signInUser != null) {
			CarDTO updatedCar = carService.updateCar(id,model, name, brand, fueltype, color, price);
			if(updatedCar != null) {
				modelMap.addAttribute("message", "Cars_Details_Updated.");
			} else {
				modelMap.addAttribute("message", "Cars_Details_Not_Updated!!!");
			} 
			
			List<CarDTO> cars = carService.myCar(signInUser);
			if (cars != null) {
				modelMap.addAttribute("cars", cars);
			} else {
				modelMap.addAttribute("message", "Cars_Not_Available!!!");
			}
			return "my_car";
		} else {
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/delete_car", method = RequestMethod.POST)
	public String deleteCar(@RequestParam(name = "id") int id, HttpSession httpSession, ModelMap modelMap) {
	    UserDTO	signInUser = (UserDTO) httpSession.getAttribute("user");
	    if(signInUser != null) {
	    	CarDTO deletedCar = carService.deleteCar(signInUser, id);
	    	if(deletedCar != null) {
	    		modelMap.addAttribute("message", "Cars_Details_Deleted.");
	    	} else {
	    		modelMap.addAttribute("message", "Cars_Details_Not_Deleted!!!");
			}
	    	
	    	List<CarDTO> cars = carService.myCar(signInUser);
			if (cars != null) {
				modelMap.addAttribute("cars", cars);
			} else {
				modelMap.addAttribute("message", "Cars_Not_Available!!!");
			}
			return "my_car";
	    } else {
	    	return "sign_in";
		}
	}

}
