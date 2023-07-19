package com.hoainong.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product")
public class Product {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productID;
	@Column(name = "`name`")
	private String name;	
	@Column(name = "`description`")
	private String description;	
	@Column(name = "price")
	private Double price;	
	@Column(name = "available")
	private Boolean available;
	@Column(name = "`image`")
	private String image;	
	@ManyToOne @JoinColumn(name = "categoryID")
	Category category;	
	@ManyToOne @JoinColumn(name = "brandID")
	Brand brand;
	@OneToMany(mappedBy = "product")
	List<InvoiceDetail> invoiceDetails;
	@OneToMany(mappedBy = "product")
	List<Gallery> galleries;
}
