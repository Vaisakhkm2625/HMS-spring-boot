package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BloodBank {
    
	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer Donor_ID;
    private String Name;
    private String Gender;
    private Integer Age;
    private String Blood_group;
    private Long Contact;
    private String Address;
    
    
    @Override
    public String toString() {
        return "BloodBank [Donor_ID=" + Donor_ID + ", Name=" + Name + ", Gender=" + Gender + ", Age=" + Age
                + ", Blood_group=" + Blood_group + ", Contact=" + Contact + ", Address=" + Address + "]";
    }
    
    
    public BloodBank() {
        super();
    }

 


    public BloodBank(Integer donor_ID, String name, String gender, Integer age, String blood_group, Long contact,
            String address) {
        super();
        Donor_ID = donor_ID;
        Name = name;
        Gender = gender;
        Age = age;
        Blood_group = blood_group;
        Contact = contact;
        Address = address;
    }

 


    public Integer getDonor_ID() {
        return Donor_ID;
    }
    public void setDonor_ID(Integer donor_ID) {
        Donor_ID = donor_ID;
    }
    public String getName() {
        return Name;
    }
    public void setName(String name) {
        Name = name;
    }
    public String getGender() {
        return Gender;
    }
    public void setGender(String gender) {
        Gender = gender;
    }
    public Integer getAge() {
        return Age;
    }
    public void setAge(Integer age) {
        Age = age;
    }
    public String getBlood_group() {
        return Blood_group;
    }
    public void setBlood_group(String blood_group) {
        Blood_group = blood_group;
    }
    public Long getContact() {
        return Contact;
    }
    public void setContact(Long contact) {
        Contact = contact;
    }
    public String getAddress() {
        return Address;
    }
    public void setAddress(String address) {
        Address = address;
    }
    
    

 

}
