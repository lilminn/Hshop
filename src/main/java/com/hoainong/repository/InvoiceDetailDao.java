package com.hoainong.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hoainong.model.InvoiceDetail;

import jakarta.transaction.Transactional;

@Repository
public interface InvoiceDetailDao extends JpaRepository<InvoiceDetail, Integer>{
//	@Query("SELECT i FROM InvoiceDetail i WHERE i.invoice.invoiceID = :id")
//	List<InvoiceDetail> findByInvoiceId(Integer id);
//	
	@Query("SELECT i FROM InvoiceDetail i WHERE i.invoice.invoiceID = ?1")
    List<InvoiceDetail> findInvoiceDetailsByInvoiceId(Integer invoiceId);

	@Transactional
    @Modifying
    @Query("UPDATE InvoiceDetail i SET i.quantity = ?1, i.total = ?2 WHERE i.product.productID = ?3 AND i.invoice.invoiceID = ?4")
    void updateQuantity(Integer quantity, Double total, Integer productID, Integer invoiceID);

//    @Transactional
//    @Modifying
//    @Query("INSERT INTO InvoiceDetail (invoiceID, productID, price, quantity, total) VALUES (?1, ?2, ?3, ?4, ?5)")
//    void addInvoiceDetail(Integer invoiceID, Integer productID, Double price, Integer quantity, Double total);
	@Query("SELECT YEAR(inv.createDate) AS Year, MONTH(inv.createDate) AS Month, SUM(invDet.price) AS TotalAmount " +
            "FROM Invoice inv JOIN inv.invoiceDetails invDet " +
            "GROUP BY YEAR(inv.createDate), MONTH(inv.createDate) " +
            "ORDER BY Year, Month")
    List<Object[]> getInvoiceStats();

}
