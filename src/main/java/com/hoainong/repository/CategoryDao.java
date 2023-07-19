package com.hoainong.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hoainong.model.Category;

public interface CategoryDao extends JpaRepository<Category, Integer> {

}
