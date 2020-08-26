package com.manish.admin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name = "PLAN_Master")
public class CreatePlanEntity {
	@Id
	@GeneratedValue
	@Column(name = "PLAN_ID")
	private Integer planId;
	
	@Column(name = "PLAN_NAME")
	private String planName;
	
	@Column(name = "PLAN_DESCRIPTION")
	private String planDescription;
	
	@Column(name = "PLAN_STARTDATE")
	private String planStartDate;
	
	@Column(name = "PLAN_ENDDATE")
	private String planEndDate;

	// Extra column need to maintain

	
	@Column(name = "ACTIVE_SW")
	private String activeSwitch;
	
//	@Column(name = "CREATED_BY")
//	private String createdBy;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_DATE")
	private Date createDate;

	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "UPDATE_DATE")
	private Date updateDate;
}
