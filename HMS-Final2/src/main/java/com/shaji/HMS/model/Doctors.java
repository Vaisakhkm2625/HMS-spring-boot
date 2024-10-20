package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Doctors {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer doctorId;
	private String name;
	private Integer departmentId;
	private Integer salary;
	private Long contact;
	private String qualification;
	private String designation;

	
	public Doctors() {
		super();
	}


	public Doctors(Integer doctorId, String name, Integer departmentId, Integer salary, Long contact, String qualification,
			String designation) {
		super();
		this.doctorId = doctorId;
		this.name = name;
		this.departmentId = departmentId;
		this.salary = salary;
		this.contact = contact;
		this.qualification = qualification;
		this.designation = designation;
	}


	public Integer getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getDepartmentId() {
		return departmentId;
	}


	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}


	public Integer getSalary() {
		return salary;
	}


	public void setSalary(Integer salary) {
		this.salary = salary;
	}


	public Long getContact() {
		return contact;
	}


	public void setContact(Long contact) {
		this.contact = contact;
	}


	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getDesignation() {
		return designation;
	}


	public void setDesignation(String designation) {
		this.designation = designation;
	}


	@Override
	public String toString() {
		return "Doctors [doctorId=" + doctorId + ", name=" + name + ", departmentId=" + departmentId + ", salary=" + salary
				+ ", contact=" + contact + ", qualification=" + qualification + ", designation=" + designation + "]";
	}
	
	

}
