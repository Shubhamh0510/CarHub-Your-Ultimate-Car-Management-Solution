package com.jspiders.spring_mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jspiders.spring_mvc.dao.CarDAO;
import com.jspiders.spring_mvc.dto.CarDTO;
import com.jspiders.spring_mvc.dto.UserDTO;

@Component
public class CarService {
	
	@Autowired
	CarDAO carDAO;

	public CarDTO addCar(String model, String name, String brand, String fueltype, String color, double price) {
		CarDTO carDTO = new CarDTO();
		carDTO.setModel(model);
		carDTO.setName(name);
		carDTO.setBrand(brand);
		carDTO.setFueltype(fueltype);
		carDTO.setColor(color);
		carDTO.setPrice(price);
		carDAO.addCar(carDTO);
		return carDTO;
	}

	public List<CarDTO> allCar() {
		List<CarDTO> cars = carDAO.allCar();
		if(cars != null && cars.size() > 0) {
			return cars;
		}
		else {
			return null;
		}
	}

	public List<CarDTO> myCar(UserDTO signInUser) {
		List<CarDTO> cars = carDAO.myCar(signInUser.getId());
		return cars;
	}

	public CarDTO getViewPage(int id) {
		CarDTO car = carDAO.getViewPage(id);
		if(car != null) {
			return car;
		} else {
			return null;
		}
	}

	public CarDTO getEditCar(int carId, int userId) {
		CarDTO car = carDAO.getEditCar(carId,userId);
		if(car != null) {
			return car;
		} else {
			return null;
		}
	}

	public CarDTO updateCar(int id, String model, String name, String brand, String fueltype, String color,
			double price) {
		CarDTO carDTO = new CarDTO();
		carDTO.setId(id);
		carDTO.setModel(model);
		carDTO.setName(name);
		carDTO.setBrand(brand);
		carDTO.setFueltype(fueltype);
		carDTO.setColor(color);
		carDTO.setPrice(price);
		CarDTO updatedCar = carDAO.updateCar(carDTO);
		return updatedCar;
	}

	public CarDTO deleteCar(UserDTO signInUser, int id) {
		CarDTO deletedCar = carDAO.deleteCar(signInUser.getId(), id);
		if(deletedCar != null) {
			return deletedCar;
		} else {
			return null;
		}
	}

}
