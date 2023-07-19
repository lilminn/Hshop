package com.hoainong.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "invoiceDetail")
public class InvoiceDetail {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer detailID;		
	@Column(name = "price")
	private Double price;
	@Column(name = "quantity")
	private Integer quantity;
	@Column(name = "total")
	private Double total;
	@ManyToOne @JoinColumn(name = "invoiceID")
	Invoice invoice;
	@ManyToOne @JoinColumn(name = "productID")
	Product product;
}
