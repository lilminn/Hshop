package com.hoainong.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hoainong.model.Feedback;

public interface FeedbbackDao extends JpaRepository<Feedback, Integer> {

}
