package com.shaji.HMS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shaji.HMS.DAO.BillingDao;
import com.shaji.HMS.DAO.DepartmentDAO;
import com.shaji.HMS.DAO.DoctorsDAO;
import com.shaji.HMS.DAO.LoginDAO;
import com.shaji.HMS.DAO.MedicinesDAO;
import com.shaji.HMS.DAO.PatientsDAO;
import com.shaji.HMS.DAO.StaffDAO;
import com.shaji.HMS.model.Billing;
import com.shaji.HMS.model.Department;
import com.shaji.HMS.model.Doctors;
import com.shaji.HMS.model.Login;
import com.shaji.HMS.model.Medicines;
import com.shaji.HMS.model.Patients;
import com.shaji.HMS.model.Staff;

@Controller
public class AdminController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	PatientsDAO patientDao;
	@Autowired
	StaffDAO staffDao;
	@Autowired
	LoginDAO loginDao;
	@Autowired
	MedicinesDAO medicinesDao;
	@Autowired
	BillingDao billingDao;
	@Autowired
	DepartmentDAO departmentDao;

	@RequestMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView("AdminPortal.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		List<Patients> patientList = patientDao.findAll();
		List<Staff> staffList = staffDao.findAll();
		List<Department> departmentList = departmentDao.findAll();
		mv.addObject("doctorList", doctorList);
		mv.addObject("patientList", patientList);
		mv.addObject("staffList", staffList);
		mv.addObject("departmentList",departmentList);
		return mv;
	}

	@RequestMapping("/addDoctor")
	public ModelAndView addDoctor(Doctors doctor) {
		doctorDao.save(doctor);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Doctor added successfully");
		return mv;
	}

	@RequestMapping("/removeDoctor")
	public ModelAndView removeDoctor(Integer doctorId) {
		Doctors doc = doctorDao.findById(doctorId).orElse(new Doctors());
		doctorDao.delete(doc);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Doctor removed successfully");
		return mv;
	}

	@RequestMapping("/addPortal")
	public ModelAndView addDoctor(Login login) {
		
		ModelAndView mv = new ModelAndView("/admin");
		List<Login> loginList = loginDao.findAll();
		Map<String,Login> m =new HashMap<String,Login>();
		System.out.println(loginList);
		for(Login l : loginList) {
			m.put(l.getUsername(), l);
			System.out.println(l.getUsername()+"bla");
		}
		System.out.println(m.containsKey(login));
		System.out.println(login);
		if(!m.containsKey(login)) {
			loginDao.save(login);
			mv.addObject("alert","Portal added successfully");
			return mv;
		}
		else {
			mv.addObject("alert","Username already exist");
			return mv;
		}
	}

	@RequestMapping("/addPatient")
	public ModelAndView addPatient(Patients patient) {
		patientDao.save(patient);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Patient added successfully");
		return mv;
	}

	@RequestMapping("/addMedicine")
	public ModelAndView addMedicine(Medicines medicine) {
		medicinesDao.save(medicine);
		ModelAndView mv = new ModelAndView("pharmacistPortal.jsp");
		mv.addObject("alert", "Medicine added successfully");
		return mv;
	}

	@RequestMapping("/removeMedicine")
	public ModelAndView removeMedicine(Medicines medicine) {
		medicinesDao.delete(medicine);
		ModelAndView mv = new ModelAndView("pharmacistPortal.jsp");
		mv.addObject("alert", "medicine removed successfully");
		return mv;
	}

	@RequestMapping("/addStaff")
	public ModelAndView addStaff(Staff staff) {
		staffDao.save(staff);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Staff added successfully");
		return mv;
	}

	@RequestMapping("/removeStaff")
	public ModelAndView removeStaff(Integer staffId) {
		Staff staff = staffDao.findById(staffId).orElse(new Staff());
		staffDao.delete(staff);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Staff removed successfully");
		return mv;
	}

	@RequestMapping("/getBillingDetailsWithPatientId")
	public ModelAndView getBillingDetailsWithPatientId(Integer patientId) {
		ModelAndView mv = new ModelAndView("/admin");
		Patients p = patientDao.findById(patientId).orElse(new Patients());
		List<Billing> billList = billingDao.findByPatientId(patientId);
		mv.addObject("billList", billList);
		mv.addObject("patientName", p.getName());
		return mv;
	}
}
