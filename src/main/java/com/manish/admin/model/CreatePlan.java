package com.manish.admin.model;

import lombok.Data;

@Data
public class CreatePlan {
	
	private Integer planId;
	private String planName;
	private String planDescription;
	private String planStartDate;
	private String planEndDate;
	

}
