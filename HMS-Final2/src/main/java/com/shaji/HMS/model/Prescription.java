package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Prescription {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer iD;
	private Integer patientID;
	private Integer docID;
	private Integer medID;
	private String prescriptiondate;
	private Integer quantity;
	private Integer appointmentId;
	
	public Prescription(Integer iD, Integer patientID, Integer docID, Integer medID, String prescriptiondate, Integer quantity,
			Integer appointmentId) {
		super();
		this.iD = iD;
		this.patientID = patientID;
		this.docID = docID;
		this.medID = medID;
		this.prescriptiondate = prescriptiondate;
		this.quantity = quantity;
		this.appointmentId = appointmentId;
	}
	public Prescription() {
		super();
	}
	public Integer getiD() {
		return iD;
	}
	public void setiD(Integer iD) {
		this.iD = iD;
	}
	public Integer getPatientID() {
		return patientID;
	}
	public void setPatientID(Integer patientID) {
		this.patientID = patientID;
	}
	public Integer getDocID() {
		return docID;
	}
	public void setDocID(Integer docID) {
		this.docID = docID;
	}
	public Integer getMedID() {
		return medID;
	}
	public void setMedID(Integer medID) {
		this.medID = medID;
	}
	public String getPrescriptiondate() {
		return prescriptiondate;
	}
	public void setPrescriptiondate(String prescriptiondate) {
		this.prescriptiondate = prescriptiondate;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}
	@Override
	public String toString() {
		return "Prescription [iD=" + iD + ", patientID=" + patientID + ", docID=" + docID + ", medID=" + medID
				+ ", prescriptiondate=" + prescriptiondate + ", quantity=" + quantity + ", appointmentId=" + appointmentId + "]";
	}


	
	
	
}