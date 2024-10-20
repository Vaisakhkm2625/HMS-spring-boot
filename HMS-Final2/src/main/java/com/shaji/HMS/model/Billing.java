package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Billing {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer billId;
	private Double billAmount;
	private String billDate;
	private Integer patientId; 
	
	public Billing(Integer billId, Double billAmount, String billDate, Integer patientId) {
		super();
		this.billId = billId;
		this.billAmount = billAmount;
		this.billDate = billDate;
		this.patientId = patientId;
	}
	public Billing() {
		super();
	}
	public Integer getbillId() {
		return billId;
	}
	public void setBillId(Integer billId) {
		this.billId = billId;
	}
	public Double getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(Double billAmount) {
		this.billAmount = billAmount;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public Integer getPatientId() {
		return patientId;
	}
	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}
	
	@Override
	public String toString() {
		return "Billing [billId=" + billId + ", billAmount=" + billAmount + ", billDate=" + billDate + ", patientId="
				+ patientId + "]";
	}

	
}