package com.jspiders.spring_mvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.jspiders.spring_mvc.dto.CarDTO;
import com.jspiders.spring_mvc.dto.UserDTO;

@Component
public class CarDAO {
	
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static EntityTransaction entityTransaction;
	
//	Open Connection Of DB
	private static void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("car_spring");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}
	
//	Close Connection Of DB
	private static void closeConnection() {
		if(entityManagerFactory != null) {
			entityManagerFactory.close();
		}
		if(entityManager != null) {
			entityManager.close();
		}
		if(entityTransaction != null) {
			if(entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
		}
	}

//	Add Car In DB
	public void addCar(CarDTO carDTO) {
		openConnection();
		entityTransaction.begin();
		
		entityManager.persist(carDTO);
		
		entityTransaction.commit();
		closeConnection();
	}

//	Find All Car In DB
	public List<CarDTO> allCar() {
		openConnection();
		
		Query query = entityManager.createQuery("Select cars from CarDTO as cars");
		@SuppressWarnings("unchecked")
		List<CarDTO> cars = query.getResultList();
		
		closeConnection();
		
		return cars;
	}

//	Find All Car By The User
	public List<CarDTO> myCar(int id) {
		openConnection();
		entityTransaction.begin();
		
		UserDTO user = entityManager.find(UserDTO.class, id);
		List<CarDTO> cars = user.getCars();
		
		entityTransaction.commit();		
		closeConnection();
		
		return cars;
	}

//	Get Specific Car By Id
	public CarDTO getViewPage(int id) {
		openConnection();
		CarDTO car = entityManager.find(CarDTO.class, id);
		closeConnection();
		
		return car;
	}

//	Get Edit Car From The Specific User
	public CarDTO getEditCar(int carId, int userId) {
		CarDTO carDTO = null;
		
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, userId);
		List<CarDTO> cars = user.getCars();
		for (CarDTO car : cars) {
			if(car.getId() == carId) {
				carDTO = entityManager.find(CarDTO.class, car.getId());
				break;
			}
		}
		
		closeConnection();
		return carDTO;
	}

//	Update Car
	public CarDTO updateCar(CarDTO carDTO) {
		openConnection();
		CarDTO car = entityManager.find(CarDTO.class, carDTO.getId());
		car.setModel(carDTO.getModel());
		car.setName(carDTO.getName());
		car.setBrand(carDTO.getBrand());
		car.setFueltype(carDTO.getFueltype());
		car.setColor(carDTO.getColor());
		car.setPrice(carDTO.getPrice());
		
		entityTransaction.begin();
		entityManager.persist(car);
		entityTransaction.commit();
		closeConnection();
		return car;
	}

	public CarDTO deleteCar(int userId, int carId) {
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, userId);
		CarDTO deletedCar = null;
		List<CarDTO> cars = user.getCars();
		for (CarDTO car : cars) {
			if(car.getId() == carId) {
				deletedCar = car;
				break;
			}
		}
		if(deletedCar != null) {
			cars.remove(deletedCar);
		}
		user.setCars(cars);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		
		CarDTO car = entityManager.find(CarDTO.class, carId);
		if(car != null) {
			entityTransaction.begin();
			entityManager.remove(car);
			entityTransaction.commit();
		}
		
		closeConnection();
		return car;
	}

}
