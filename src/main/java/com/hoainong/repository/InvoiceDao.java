package com.hoainong.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hoainong.model.Invoice;

@Repository
public interface InvoiceDao extends JpaRepository<Invoice, Integer> {
	 @Query("SELECT i FROM Invoice i WHERE i.user.userID = ?1")
	    List<Invoice> findInvoicesByUserId(Integer userId);
}

