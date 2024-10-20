package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Department;

public interface DepartmentDAO  extends CrudRepository<Department, Integer>{
	
	public List<Department> findAll();

}
