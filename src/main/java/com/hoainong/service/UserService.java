package com.hoainong.service;

import com.hoainong.model.User;

public interface UserService {
	boolean existsByEmail(String email);
    boolean existsByPhone(String phone);
    User login(String email,String password);
    User findUserByEmail(String email);
  
}
