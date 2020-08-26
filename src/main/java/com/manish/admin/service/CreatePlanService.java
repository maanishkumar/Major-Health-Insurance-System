package com.manish.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.manish.admin.entity.CreatePlanEntity;
import com.manish.admin.model.CreatePlan;

@Service
public interface CreatePlanService {
	
	boolean savePlan(CreatePlan cp);

	
	public List<CreatePlanEntity> getAllPlans();

	boolean deletePlan(Integer planId);

	public CreatePlan getPlanAccountById(Integer planId);

	boolean activatePlan(Integer planId);

}
