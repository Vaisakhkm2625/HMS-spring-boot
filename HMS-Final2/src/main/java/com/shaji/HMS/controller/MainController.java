package com.shaji.HMS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shaji.HMS.DAO.DepartmentDAO;
import com.shaji.HMS.DAO.DoctorsDAO;
import com.shaji.HMS.DAO.MedicinesDAO;
import com.shaji.HMS.DAO.PatientsDAO;
import com.shaji.HMS.DAO.PrescriptionDAO;
import com.shaji.HMS.model.Department;
import com.shaji.HMS.model.Doctors;
import com.shaji.HMS.model.Medicines;

@Controller
public class MainController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	PatientsDAO patientDao;
	@Autowired
	MedicinesDAO medicinesDao;
	@Autowired
	DepartmentDAO departmentDao;
	@Autowired
	PrescriptionDAO prescriptionDao;

	@RequestMapping("/home")
	public String home() {
		return "home.jsp";
	}

	@RequestMapping("/")
	public String home1() {
		return "home.jsp";
	}

	@RequestMapping("/fetchDoctor")
	public ModelAndView fetchDoctor() {
		ModelAndView mv = new ModelAndView("Doctors.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		List<Department> departmentList = departmentDao.findAll();
		mv.addObject("doctorList", doctorList);
		mv.addObject("departmentList",departmentList);
		return mv;
	}
	
	@RequestMapping("/findDoctorbyDepartmentId")
	public ModelAndView findDoctorbyDepartmentId(Integer departmentId) {
		ModelAndView mv = new ModelAndView("Doctors.jsp");
		List<Doctors> doctorList = doctorDao.findByDepartmentId(departmentId);
		List<Department> departmentList = departmentDao.findAll();
		mv.addObject("doctorList", doctorList);
		mv.addObject("departmentList",departmentList);
		return mv;
	}

	@RequestMapping("/BloodBank")
	public String bloodBank() {
		return "BloodBank.jsp";
	}

	@RequestMapping("/pharmacy")
	public ModelAndView pharmacy() {
		ModelAndView mv = new ModelAndView("Pharmacy.jsp");
		List<Medicines> medicines = medicinesDao.findAll();
		for (Medicines m : medicines) {
			System.out.println(m);
		}
		mv.addObject("list", medicines);
		return mv;
	}

	@RequestMapping("/quickhelp")
	public String quickhelp() {
		return "quickhelp.jsp";
	}

	@RequestMapping("/covidPortal")
	public String covidPortal() {
		return "covidPortal.jsp";
	}

	@RequestMapping("/donorDetails")
	public String donorDetails() {
		return "DonationDetails.jsp";
	}

	@RequestMapping("/pharmacistPortal")
	public ModelAndView pharmacistPortal() {
		ModelAndView mv = new ModelAndView("pharmacistPortal1.jsp");
		List<Medicines> medicines = medicinesDao.findAll();
		for (Medicines m : medicines) {
			System.out.println(m);
		}
		mv.addObject("list", medicines);
		return mv;
	}

	@RequestMapping("/dashboard")
	public  ModelAndView dashboard() {
		ModelAndView mv = new ModelAndView("Dashboard.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		mv.addObject("noOfDoctors", doctorList.size());		
		return mv;
	}

}
