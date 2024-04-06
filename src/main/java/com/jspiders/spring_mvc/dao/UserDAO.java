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
public class UserDAO {
	
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static EntityTransaction entityTransaction;
	
	private static void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("car_spring");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}
	
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

	public void addUser(UserDTO userDTO) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(userDTO);		
		entityTransaction.commit();
		closeConnection();
	}
	
	public List<UserDTO> allUser() {
		openConnection();
		
		Query query = entityManager.createQuery("Select users from UserDTO as users");
		@SuppressWarnings("unchecked")
		List<UserDTO> users = query.getResultList();
		
		closeConnection();
		return users;
	}

	public void updateUserCar(int userId, int carId) {
		openConnection();
		
		UserDTO user = entityManager.find(UserDTO.class, userId);
		CarDTO car = entityManager.find(CarDTO.class, carId);
		List<CarDTO> cars = user.getCars();
		cars.add(car);
		user.setCars(cars);
		
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		
		closeConnection();
	}

	public void deleteUser(int id) {
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, id);
		entityTransaction.begin();
		entityManager.remove(user);
		entityTransaction.commit();
		closeConnection();
		
	}

}
