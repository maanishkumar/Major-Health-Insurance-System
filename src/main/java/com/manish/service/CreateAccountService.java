package com.manish.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.manish.entity.CreateAccountEntity;
import com.manish.model.CreateAccount;
@Service
public interface CreateAccountService {
	
	boolean saveAccount(CreateAccount ca);

	public CreateAccountEntity getAccountByUserEmailAndUserPassword(String email, String tempPwd);

	boolean updateAccount(CreateAccountEntity entity);
	
	public List<CreateAccountEntity> getAllAccounts();
	
	boolean deleteAccount(Integer accountId);

	boolean activateAccount(Integer accountId);
	
	public CreateAccount getAccountById(Integer accountId);
	
	


}
