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

import com.manish.admin.entity.CreateAccountEntity;
import com.manish.admin.model.CreateAccount;
import com.manish.admin.service.CreateAccountService;

@Controller
public class CreateAccountController {
	@Autowired
	private CreateAccountService service;

	@GetMapping("/loadForm")
	public String loadCreateAccountform(Model model) {
		CreateAccount ca = new CreateAccount();
		model.addAttribute("account", ca);
		return "CreateAccount";
	}

	@PostMapping("/create")
	public String handleCreateAccountform(@ModelAttribute("account") CreateAccount ca, RedirectAttributes attributes) {

		if (ca.getAccountId() != null) {
			boolean isUpdate = service.updateAccount(ca);
			if (isUpdate) {
				attributes.addFlashAttribute("UpdateMsg", "Account Updated Successfully..");
			} else {
				attributes.addFlashAttribute("UpdErrMsg", "Failed to update account..");
			}
		} else {
			boolean isSaved = service.saveAccount(ca);
			if (isSaved) {
				attributes.addFlashAttribute("msg",
						"Your Registration is almost complete ,please check ur mail to unlock it...");
			} else {
				attributes.addFlashAttribute("errMsg", "Failed to create account..!");
			}
		}
		return "redirect:/loadForm";
	}

	@GetMapping("/viewAccount")
	public String viewAccountBtn(Model model) {
		List<CreateAccountEntity> allAccounts = service.getAllAccounts();
		model.addAttribute("accounts", allAccounts);
		return "ViewAccount";
	}

	@GetMapping("/editAccount")
	public String editAccount(@RequestParam("aid") Integer accountId, Model model) {
		CreateAccount ca = service.getAccountById(accountId);
		model.addAttribute("account", ca);
		return "CreateAccount";
	}

	@GetMapping("/deleteAccount")
	public String deleteAccount(@RequestParam("aid") Integer accountId, RedirectAttributes attributes) {
		boolean isDeleted = service.deleteAccount(accountId);
		if (isDeleted) {
			attributes.addFlashAttribute("DeleteMsg", "Account Deleted Successfully!!..");
			return "redirect:/viewAccount";
		}
		return null;
	}

	@GetMapping("/activateAccount")
	public String activateAccount(@RequestParam("aid") Integer accountId, RedirectAttributes attributes) {
		boolean isActive = service.activateAccount(accountId);
		if (isActive) {
			attributes.addFlashAttribute("ActivateMsg", "Account Activated Successfully!!..");
			return "redirect:/viewAccount";
		}
		return null;
	}

}
