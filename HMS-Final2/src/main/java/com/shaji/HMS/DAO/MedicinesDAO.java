package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Medicines;

public interface MedicinesDAO extends CrudRepository<Medicines, Integer>{
	
	public List<Medicines> findAll();
	

}
