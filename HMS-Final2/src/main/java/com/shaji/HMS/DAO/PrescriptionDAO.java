package com.shaji.HMS.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shaji.HMS.model.Prescription;

public interface PrescriptionDAO extends CrudRepository<Prescription, Integer> {

	public List<Prescription> findAll();

	public List<Prescription> findByPatientID(Integer patientId);
}
