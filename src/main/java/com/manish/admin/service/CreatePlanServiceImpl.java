package com.manish.admin.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manish.admin.entity.CreateAccountEntity;
import com.manish.admin.entity.CreatePlanEntity;
import com.manish.admin.model.CreatePlan;
import com.manish.admin.repository.CreatePlanRepository;

@Service
public class CreatePlanServiceImpl implements CreatePlanService {

	@Autowired
	private CreatePlanRepository repository;

	@Override
	public boolean savePlan(CreatePlan cp) {
		CreatePlanEntity entity = new CreatePlanEntity();
		BeanUtils.copyProperties(cp, entity);
		entity.setActiveSwitch("Y");
		CreatePlanEntity isSaved = repository.save(entity);
		return isSaved != null;
	}

	@Override
	public List<CreatePlanEntity> getAllPlans() {
		List<CreatePlanEntity> listPlan = repository.findAll();
		return listPlan;
	}

	@Override
	public boolean deletePlan(Integer planId) {
		Optional<CreatePlanEntity> planDtls = repository.findById(planId);

		if (planDtls.isPresent()) {
			CreatePlanEntity entity = planDtls.get();
			entity.setActiveSwitch("N");
			repository.save(entity);
			return true;
		}
		return false;
	}

	@Override
	public CreatePlan getPlanAccountById(Integer planId) {
		CreatePlanEntity entity = repository.findById(planId).get();
		if (entity != null) {
			CreatePlan cp = new CreatePlan();
			BeanUtils.copyProperties(entity, cp);
			return cp;
		}
		return null;

	}

	@Override
	public boolean activatePlan(Integer planId) {
		Optional<CreatePlanEntity> planDtls = repository.findById(planId);

		if (planDtls.isPresent()) {
			CreatePlanEntity entity = planDtls.get();
			entity.setActiveSwitch("Y");
			repository.save(entity);
			return true;
		}
		return false;
	}

}
