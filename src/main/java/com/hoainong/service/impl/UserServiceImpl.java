package com.hoainong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoainong.model.User;
import com.hoainong.repository.UserDao;
import com.hoainong.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao dao;
	
	@Override
	public boolean existsByEmail(String email) {
		List<User> users = dao.findAll();
		for (User user : users) {
			if(user.getEmail().equals(email)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean existsByPhone(String phone) {
		List<User> users = dao.findAll();
		for (User user : users) {
			if(user.getEmail().equals(phone)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public User login(String email, String password) {
		List<User> users = dao.findAll();
		for (User user : users) {
			if(user.getEmail().equals(email) && user.getPassword().equals(password)){
				return user;
			}
		}
		return null;
	}

	@Override
	public User findUserByEmail(String email) {
		List<User> users = dao.findAll();
		for (User user : users) {
			if(user.getEmail().equals(email)){
				return user;
			}
		}
		return null;
	}

	

}
