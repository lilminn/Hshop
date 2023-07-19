package com.hoainong.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hoainong.model.Statistical;

public interface StatisticalDao  extends JpaRepository<Statistical, Integer> {
	
}
