package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Login;

public interface LoginDAO extends CrudRepository<Login, Integer> {

	public List<Login> findAll(); 
	public Login findByUsername(String username);
}
