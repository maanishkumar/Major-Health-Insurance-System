package com.manish.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manish.admin.entity.CreateAccountEntity;
import com.manish.admin.model.UnlockAccount;
import com.manish.admin.service.CreateAccountService;

@Controller
public class UnlockAccountController {

	@Autowired
	private CreateAccountService service;

	@GetMapping("/unlockAcc")
	public String loadUserUnlockForm(@RequestParam("email") String email, Model model) {

		UnlockAccount unlockUser = new UnlockAccount();
		unlockUser.setEmail(email);
		model.addAttribute("unlockUser", unlockUser);

		return "UnlockAccount";
	}

	@PostMapping("/unlockUserAcc")
	public String handleUnlockBtn(@ModelAttribute("unlockUser") UnlockAccount acc, Model model) {

		CreateAccountEntity entity = service.getAccountByUserEmailAndUserPassword(acc.getEmail(), acc.getTempPwd());

		if (entity != null) {

			// update password and account status and display success message

			entity.setLockStatus("UN-LOCKED");
			entity.setPassword(acc.getNewPwd());
			boolean isUpdated = service.updateAccount(entity);
			if (isUpdated) {
				return "UnlockAccount";

			}
		}

		// display error message
		model.addAttribute("errMsg", "Please enter correct temporary password..");
		return "UnlockAccount";
	}
}
