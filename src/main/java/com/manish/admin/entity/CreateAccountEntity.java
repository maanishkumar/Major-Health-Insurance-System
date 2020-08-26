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
@Table(name = "Account_Master")
public class CreateAccountEntity {

	@Id
	@GeneratedValue
	@Column(name = "ACCOUNT_ID")
	private Integer accountId;

	@Column(name = "FIRST_NAME")
	private String firstName;

	@Column(name = "LAST_NAME")
	private String lastName;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "ROLE")
	private String role;

	// Extra column need to maintain

	@Column(name = "NAME")
	private String name;

	@Column(name = "LOCK_STATUS")
	private String lockStatus;

	@Column(name = "DELETE_SW")
	private String deletedSwitch;

	@Column(name = "PASSWORD")
	private String password;

	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_DATE", updatable = false)
	private Date createDate;

	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name = "UPDATE_DATE", insertable = false)
	private Date updateDate;

}
