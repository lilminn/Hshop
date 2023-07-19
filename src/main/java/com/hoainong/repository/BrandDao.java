package com.hoainong.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hoainong.model.Brand;

public interface BrandDao extends JpaRepository<Brand, Integer> {

}
