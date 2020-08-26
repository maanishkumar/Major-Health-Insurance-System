package com.manish.admin.model;

import lombok.Data;

@Data
public class CreateAccount {

	private Integer accountId;
	private String firstName;
	private String lastName;
	private String email;
	private String gender;
	private String role;

}
