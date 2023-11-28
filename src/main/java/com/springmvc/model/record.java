package com.springmvc.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class record {
	@Id
	@Column
	private int record_id;
	@Column
	private boolean type;
	@Column
	private String reason;
	@Column
	private Date date;

	@ManyToOne
	@JoinColumn(name="staff_id")
	private staff staff;	
	
	
	
	
	public record(boolean type, String reason, Date date, com.springmvc.model.staff staff) {
		super();
		this.type = type;
		this.reason = reason;
		this.date = date;
		this.staff = staff;
	}

	public record() {
		// TODO Auto-generated constructor stub
	}

	public int getRecord_id() {
		return record_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}

	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public staff getStaff() {
		return staff;
	}

	public void setStaff(staff staff) {
		this.staff = staff;
	}

	
}
