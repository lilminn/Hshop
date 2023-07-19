package com.hoainong.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.hoainong.model.User;

public interface UserDao extends JpaRepository<User, Integer> {
	@Query("Select o from User o where o.fullName Like ?1")
	List<User> findUserByKey(String keywords);
	@Modifying
	@Query("UPDATE User u SET u.email = :email, u.fullName = :fullName, u.phone = :phone, u.birthday = :birthday WHERE u.userID = :userID")
	void updateUserProfile(@Param("email") String email, @Param("fullName") String fullName,
			@Param("phone") String phone, @Param("birthday") Date birthday, @Param("userID") Integer userID);
}
