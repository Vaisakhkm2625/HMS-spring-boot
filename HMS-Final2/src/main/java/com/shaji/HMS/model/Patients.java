package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Patients {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer iD;
	private String name;
	private Integer age;
	private String address;
	private Long contact;
	private String gender;
	
	public Patients(Integer iD, String name, Integer age, String address, Long contact, String gender) {
		super();
		this.iD = iD;
		this.name = name;
		this.age = age;
		this.address = address;
		this.contact = contact;
		this.gender = gender;
	}
	public Patients() {
		super();
	}
	public Integer getiD() {
		return iD;
	}
	public void setiD(Integer iD) {
		this.iD = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getContact() {
		return contact;
	}
	public void setContact(Long contact) {
		this.contact = contact;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return "Patients [iD=" + iD + ", name=" + name + ", age=" + age + ", address=" + address + ", contact="
				+ contact + ", gender=" + gender + "]";
	}
	
	
}