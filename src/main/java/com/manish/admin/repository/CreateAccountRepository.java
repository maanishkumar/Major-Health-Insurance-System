package com.manish.admin.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.manish.admin.entity.CreateAccountEntity;

public interface CreateAccountRepository extends JpaRepository<CreateAccountEntity, Serializable> {

	public CreateAccountEntity findByEmailAndPassword(String userEmail,String userPassword);
	
	
}
