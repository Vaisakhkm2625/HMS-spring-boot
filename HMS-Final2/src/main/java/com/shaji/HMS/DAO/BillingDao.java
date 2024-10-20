package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Billing;

public interface BillingDao extends CrudRepository<Billing, Integer> {
	
	public List<Billing> findByPatientId(Integer patientId);
	public List<Billing> findAll();

}
