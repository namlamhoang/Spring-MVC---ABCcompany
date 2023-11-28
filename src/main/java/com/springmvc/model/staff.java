package com.springmvc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.springmvc.helper.datehelper;
import com.sun.istack.NotNull;

@Entity
@Table
public class staff {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int staff_id;
	@Column
	@NotNull
	private String name;
	@Column
	@NotNull
	private boolean gender;
	@Column
	@NotNull
	private Date birthday;
	@Column
	@NotNull
	private byte[] photo;
	@Column
	@NotNull
	private String email;
	@Column
	@NotNull
	private String phone;
	@Column
	@NotNull
	private double salary;
	@Column
	@NotNull
	private int level;
	@Column
	private String note;
	@Column
	@NotNull
	private int depart_id;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "staff")
	@JsonIgnore
    private List<record> record = new ArrayList<>();
    
    

	public List<record> getRecord() {
		return record;
	}




	public void setRecord(List<record> record) {
		this.record = record;
	}




	public staff() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public staff(int staff_id, String email) {
		this.staff_id = staff_id;
		this.email = email;
	}




	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = datehelper.toDate(birthday);
		
	}



	public byte[] getPhoto() {
		return photo;
	}




	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}




	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(int depart_id) {
		this.depart_id = depart_id;
	}

	
	
	
}
