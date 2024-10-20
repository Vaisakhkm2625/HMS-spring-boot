package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.BloodBank;

public interface BloodBankDAO extends CrudRepository<BloodBank, Integer> {
	
	public List<BloodBank> findAll();

}
