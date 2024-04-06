package com.jspiders.spring_mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jspiders.spring_mvc.dao.UserDAO;
import com.jspiders.spring_mvc.dto.CarDTO;
import com.jspiders.spring_mvc.dto.UserDTO;

@Component
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public UserDTO addUser(String email, String password) {
		boolean flag = true;
		List<UserDTO> users = userDAO.allUser();
		for (UserDTO user : users) {
			if(user.getEmail().equals(email)) {
				flag = false;
				break;
			}
		}
		if(flag) {
			UserDTO userDTO = new UserDTO();
			userDTO.setEmail(email);
			userDTO.setPassword(password);
			userDAO.addUser(userDTO);
			return userDTO;
		} else {
			return null;
		}
	}

	public UserDTO signInUser(String email, String password) {
		List<UserDTO> users = userDAO.allUser();
		UserDTO signInUser = null;
		for (UserDTO user : users) {
			if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
				signInUser = user;
				break;
			}
		}
		return signInUser;
	}

	public void updateUserCar(UserDTO signInUser, CarDTO addedCar) {
		userDAO.updateUserCar(signInUser.getId(),addedCar.getId());
	}

	public void deleteUser(UserDTO signedInUser) {
		userDAO.deleteUser(signedInUser.getId());
	}


}
