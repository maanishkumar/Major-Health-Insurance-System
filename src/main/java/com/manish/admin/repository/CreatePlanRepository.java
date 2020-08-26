package com.manish.admin.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.manish.admin.entity.CreatePlanEntity;

public interface CreatePlanRepository extends JpaRepository<CreatePlanEntity, Serializable> {

}
