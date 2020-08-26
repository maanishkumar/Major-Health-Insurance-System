package com.manish.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.manish.admin.entity.CreatePlanEntity;
import com.manish.admin.model.CreatePlan;
import com.manish.admin.service.CreatePlanService;

@Controller
public class CreatePlanController {
	@Autowired
	private CreatePlanService service;

	@GetMapping("/loadPlanForm")
	public String loadCreatePlanform(Model model) {
		CreatePlan cp = new CreatePlan();
		model.addAttribute("account", cp);
		return "CreatePlan";
	}

	@PostMapping("/createPlan")
	public String handleCreateAccountform(@ModelAttribute("account") CreatePlan cp, RedirectAttributes attributes) {

		if (cp.getPlanId() != null) {
			boolean isUpdate = service.savePlan(cp);
			if (isUpdate) {
				attributes.addFlashAttribute("UpdateMsg", "Plan Updated successfully..");
			}
		} else {
			boolean isSaved = service.savePlan(cp);
			if (isSaved) {
				attributes.addFlashAttribute("msg", "Plan Created Successfully!..");
			} else {
				attributes.addFlashAttribute("errMsg", "Failed to create plan try again..!");
			}
		}
		return "redirect:/loadPlanForm";
	}
	
	
	@GetMapping("/viewPlan")
	public String viewPlanAccountBtn(Model model) {
		List<CreatePlanEntity> allPlanAccounts = service.getAllPlans();
		model.addAttribute("plans", allPlanAccounts);
		return "ViewPlan";
	}

	@GetMapping("/editPlan")
	public String editPlanAccount(@RequestParam("pid") Integer planId, Model model) {
		CreatePlan cp = service.getPlanAccountById(planId);
		model.addAttribute("account", cp);
		return "CreatePlan";
	}

	@GetMapping("/deletePlan")
	public String deleteAccount(@RequestParam("pid") Integer planId, RedirectAttributes attributes) {
		boolean isDeleted = service.deletePlan(planId);
		if (isDeleted) {
			attributes.addFlashAttribute("DeleteMsg", "Plan Deleted Successfully !!");
			return "redirect:/viewPlan";
		}
		return null;
	}

	@GetMapping("/activatePlan")
	public String activatePlan(@RequestParam("pid") Integer planId, RedirectAttributes attributes) {
		boolean isActive = service.activatePlan(planId);
		if (isActive) {
			attributes.addFlashAttribute("ActivateMsg", "Plan Activated Successfully !!");
			return "redirect:/viewPlan";
		}
		return null;
	}


}
