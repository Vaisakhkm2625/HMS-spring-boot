package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Staff;

public interface StaffDAO extends CrudRepository<Staff, Integer> {

	public List<Staff> findAll();
}
