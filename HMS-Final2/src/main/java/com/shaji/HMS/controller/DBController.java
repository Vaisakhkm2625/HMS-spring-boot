package com.shaji.HMS.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shaji.HMS.DAO.AppointmentDAO;
import com.shaji.HMS.DAO.BillingDao;
import com.shaji.HMS.DAO.BloodBankDAO;
import com.shaji.HMS.DAO.DoctorsDAO;
import com.shaji.HMS.DAO.MedicinesDAO;
import com.shaji.HMS.DAO.PatientsDAO;
import com.shaji.HMS.DAO.PrescriptionDAO;
import com.shaji.HMS.model.Appointment;
import com.shaji.HMS.model.Billing;
import com.shaji.HMS.model.BloodBank;
import com.shaji.HMS.model.Doctors;
import com.shaji.HMS.model.Medicines;
import com.shaji.HMS.model.Patients;
import com.shaji.HMS.model.Prescription;

@Controller
public class DBController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	PatientsDAO patientDao;
	@Autowired
	BloodBankDAO bloodBankDao;
	@Autowired
	PrescriptionDAO prescriptionDao;
	@Autowired
	MedicinesDAO medicinesDao;
	@Autowired
	AppointmentDAO appointmentDao;
	@Autowired
	BillingDao billingDao;
	
	/**
	 * 
	 * @param donor
	 * @return ModelAndView mv
	 * This will add the blood donor details into the database and return the same webpage with an alert stating Donation details submitted.
	 */
	@RequestMapping("/addDonorDetails")
	public ModelAndView addDonorDetails(BloodBank donor) {
		bloodBankDao.save(donor);
		ModelAndView mv = new ModelAndView("DonationDetails.jsp");
		mv.addObject("alert","Donation details submitted");
		return mv;
	}
	
	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will dispaly the webpage to book appointment for the patient.
	 */
	@RequestMapping("/bookAppointment")
	public ModelAndView bookAppointment(String username) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String min = now.format(formatter);
		String max = now.plusWeeks(1).format(formatter);
		ModelAndView mv = new ModelAndView("BookAppointment.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		mv.addObject("doctorList", doctorList);
		Patients p = patientDao.findByName(username);
		mv.addObject("min",min);
		mv.addObject("max",max);
		mv.addObject("patient", p);
		mv.addObject("username", username);
		return mv;
	}
	
	/**
	 * 
	 * @param appointment
	 * @return ModelAndView mv
	 * This will add appointment details of the patient into the database.
	 */
	@RequestMapping("/addAppointment")
	public ModelAndView addAppointment(Appointment appointment) {
//		String date = appointment.getApplicationDate();
//		appointment.setApplicationDate(date.format(DateTimeFormatter.ofPattern("MM/d/uuuu")));
//		appointment.setApplicationDate(LocalDate.now().format(DateTimeFormatter.ofPattern("MM/d/uuuu")));
		appointment.setApplicationStatus(0);
		appointmentDao.save(appointment);
		Patients p = patientDao.findById(appointment.getPatientId()).orElse(new Patients());
		ModelAndView mv = new ModelAndView("/bookAppointment?username="+p.getName());
		mv.addObject("patient",p);
		mv.addObject("alert","Appointment booked successfully");
		List<Doctors> doctorList = doctorDao.findAll();
		mv.addObject("doctorList", doctorList);
		return mv;
	}
	
	
	/**
	 * 
	 * @param name
	 * @return ModelAndView mv
	 * this will return the webpage with medicines list and provides the bill for the medicines.
	 */
	@RequestMapping("/getMedicinesByPatientId")
	public ModelAndView getMedicinesByPatientId(String name) {
		Patients p = patientDao.findByName(name);
		ModelAndView mv = new ModelAndView("getPatientMedicines.jsp");
		List<Prescription> prescriptions = prescriptionDao.findByPatientID(p.getiD());
		List<Medicines> med = new ArrayList<Medicines>();
		double sum = 0;
		for (Prescription pre : prescriptions) {
			Medicines m = medicinesDao.findById(pre.getMedID()).orElse(new Medicines());
			for(int i=0; i<med.size();i++) {
				if(med.get(i).getId()==m.getId());
				else
					med.add(m);
				}
			sum += pre.getQuantity() * m.getPrice();

		}

		mv.addObject("med", med);
		mv.addObject("total", sum);
		mv.addObject("list", prescriptions);
		mv.addObject("username",name);
		return mv;
	}
	
	@RequestMapping("/getMedicines")
	public ModelAndView getMedicines(String name) {
		Patients p = patientDao.findByName(name);
		ModelAndView mv = new ModelAndView("patientMedicines.jsp");
		List<Prescription> prescriptions = prescriptionDao.findByPatientID(p.getiD());
		List<Medicines> med = new ArrayList<Medicines>();
		double sum = 0;
		for (Prescription pre : prescriptions) {
			Medicines m = medicinesDao.findById(pre.getMedID()).orElse(new Medicines());
			for(int i=0; i<med.size();i++) {
			if(med.get(i).getId()==m.getId());
			else
				med.add(m);
			}
			sum += pre.getQuantity() * m.getPrice();

		}
		
		List<Billing> billList = billingDao.findByPatientId(p.getiD());
		Billing bill = new Billing();
		if (sum > 0) {
			bill.setBillDate(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			bill.setPatientId(p.getiD());
			bill.setBillAmount(sum);
			for(int i=0; i<billList.size(); i++) {
				if((billList.get(i).getPatientId()==bill.getPatientId())&&(billList.get(i).getBillAmount()==bill.getBillAmount())&&(billList.get(i).getBillDate().equals(bill.getBillDate())));
				else
					billingDao.save(bill);
			}
			
		}
		
		mv.addObject("billList", billList);

		mv.addObject("med", med);
		mv.addObject("total", sum);
		mv.addObject("list", prescriptions);
		mv.addObject("username",name);
		return mv;
	}
	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will return the appointments webpage with all the appointments the doctor has to attend.
	 */
	@RequestMapping("/appointmentList")
	public ModelAndView appointmentList(String username) {
		Doctors doc = doctorDao.findByName(username);
		ModelAndView mv = new ModelAndView("Appointments.jsp");
		List<Appointment> appointmentList2 = appointmentDao.findByDoctorId(doc.getDoctorId());
		List<Appointment> appointmentList = new ArrayList<Appointment>();
		for(Appointment a : appointmentList2) {
			if((!a.getApplicationDate().equalsIgnoreCase(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))||(a.getApplicationStatus()==1));
			else
				appointmentList.add(a);
			}
		mv.addObject("list", appointmentList);
		mv.addObject("username", username);
		return mv;
	}
	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will display the webpage with all the appointments the doctor has and he can select a specific apoointment to attend.
	 */
	@RequestMapping("/currentAppointment")
	public ModelAndView currentAppointment(String username) {
		Doctors doc = doctorDao.findByName(username);
		ModelAndView mv = new ModelAndView("CurrentPatient.jsp");
		List<Appointment> appointmentList2 = appointmentDao.findByDoctorId(doc.getDoctorId());
		List<Appointment> appointmentList = new ArrayList<Appointment>();
		for(Appointment a : appointmentList2) {
			if((!a.getApplicationDate().equalsIgnoreCase(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))||(a.getApplicationStatus()==1));
			else
				appointmentList.add(a);
			}
		mv.addObject("list", appointmentList);
		mv.addObject("username", username);
		return mv;
	}
	
	/**
	 * 
	 * @param appointmentId
	 * @return ModelAndView mv
	 * This will return the current appointment webpage with the appointment details and patient details of the patient.
	 */
	@RequestMapping("/currentPatient")
	public ModelAndView currentPatient(Integer appointmentId) {
		Appointment app = appointmentDao.findById(appointmentId).orElse(new Appointment());
		Patients p = patientDao.findById(app.getPatientId()).orElse(new Patients());
		ModelAndView mv = new ModelAndView("CurrentPatient1.jsp");
		mv.addObject("patient",p);
		mv.addObject("appointment",app);
		List<Medicines> medicineList = medicinesDao.findAll();
		mv.addObject("list", medicineList);
		return mv;
	}
	/**
	 * 
	 * @param prescription
	 * @return ModelAndView mv
	 * This will return the webpage to add the prescription details of the patient.
	 */
	@RequestMapping("/addPrescription")
	public ModelAndView addPrescription(Prescription prescription) {
		prescription.setPrescriptiondate(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		prescriptionDao.save(prescription);
		Appointment app = appointmentDao.findById(prescription.getAppointmentId()).orElse(new Appointment());
		Patients p = patientDao.findById(app.getPatientId()).orElse(new Patients());
		ModelAndView mv = new ModelAndView("/currentPatient");
		mv.addObject("patient",p);
		mv.addObject("appointment",app);
		List<Medicines> medicineList = medicinesDao.findAll();
		mv.addObject("list", medicineList);
		return mv;
	}
	
	/**
	 * 
	 * @param doctorId
	 * @param appointmentId
	 * @return ModelAndView mv
	 * 
	 * This will display the webpage with all the appointments the doctor has and he can select a specific apoointment to attend. It will remove the sppointment id of which he have attended.
	 */
	
	@RequestMapping("/currentAppointmentt")
	public ModelAndView currentAppointmentt(Integer doctorId, Integer appointmentId) {
		Doctors doc = doctorDao.findById(doctorId).orElse(new Doctors());
		Appointment app = appointmentDao.findById(appointmentId).orElse(new Appointment());
		app.setApplicationStatus(1);
		appointmentDao.save(app);
		ModelAndView mv = new ModelAndView("CurrentPatient.jsp");
		List<Appointment> appointmentList2 = appointmentDao.findByDoctorId(doctorId);
		List<Appointment> appointmentList = new ArrayList<Appointment>();
		for(Appointment a : appointmentList2) {
			if((!a.getApplicationDate().equalsIgnoreCase(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))||(a.getApplicationStatus()==1));
			else
				appointmentList.add(a);
			}
		mv.addObject("list", appointmentList);
		mv.addObject("username", doc.getName());
		return mv; 
	}

	

	
}
