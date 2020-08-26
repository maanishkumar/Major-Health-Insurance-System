package com.manish.admin.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manish.admin.entity.CreateAccountEntity;
import com.manish.admin.model.CreateAccount;
import com.manish.admin.repository.CreateAccountRepository;
import com.manish.utils.EmailUtils;
import com.manish.utils.PwdUtils;

@Service
public class CreateAccountServiceImpl implements CreateAccountService {

	@Autowired
	private CreateAccountRepository repository;
	@Autowired
	private EmailUtils utils;

	@Override
	public boolean saveAccount(CreateAccount ca) {

		CreateAccountEntity entity = new CreateAccountEntity();
		BeanUtils.copyProperties(ca, entity);

		entity.setDeletedSwitch("N");
		entity.setLockStatus("LOCKED");
		entity.setName(entity.getFirstName() + " " + entity.getLastName());
		entity.setPassword(PwdUtils.randomAlphaNumeric(6));

		CreateAccountEntity save = repository.save(entity);
		if (save.getAccountId() != null) {
			utils.sendUserUnlockAccEmail(entity);
			return true;
		}
		return false;
	}
	
	@Override
	public boolean updateAccount(CreateAccount ca) {
		CreateAccountEntity entity = repository.findById(ca.getAccountId()).get();
		BeanUtils.copyProperties(ca, entity);
		entity.setName(entity.getFirstName() + " " + entity.getLastName());
		CreateAccountEntity isUpdated = repository.save(entity);
		return isUpdated!=null;
	}

	@Override
	public CreateAccountEntity getAccountByUserEmailAndUserPassword(String email, String tempPwd) {
		CreateAccountEntity entity = repository.findByEmailAndPassword(email, tempPwd);
		return entity;
	}

	@Override
	public boolean updateAccount(CreateAccountEntity entity) {
		CreateAccountEntity isSaved = repository.save(entity);
		return isSaved != null;
	}

	@Override
	public List<CreateAccountEntity> getAllAccounts() {
		List<CreateAccountEntity> listAccount = repository.findAll();
		return listAccount;
	}

	@Override
	public boolean deleteAccount(Integer accountId) {
		Optional<CreateAccountEntity> accountDtls = repository.findById(accountId);

		if (accountDtls.isPresent()) {
			CreateAccountEntity entity = accountDtls.get();
			entity.setDeletedSwitch("Y");
			repository.save(entity);
			return true;
		}
		return false;
	}

	@Override
	public boolean activateAccount(Integer accountId) {
		Optional<CreateAccountEntity> accountDtls = repository.findById(accountId);

		if (accountDtls.isPresent()) {
			CreateAccountEntity entity = accountDtls.get();
			entity.setDeletedSwitch("N");
			repository.save(entity);
			return true;
		}
		return false;
	}

	@Override
	public CreateAccount getAccountById(Integer accountId) {
		CreateAccountEntity entity = repository.findById(accountId).get();
		if (entity != null) {
			CreateAccount ca = new CreateAccount();
			BeanUtils.copyProperties(entity, ca);
			return ca;
		}
		return null;
	}



	

}
