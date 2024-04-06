package com.jspiders.spring_mvc.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "car_spring_mvc")
public class CarDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String model;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false)
	private String brand;
	
	@Column(nullable = false)
	private String fueltype;
	
	@Column(nullable = false)
	private String color;
	
	@Column(nullable = false)
	private double price;

}
