package com.hoainong.model;

import java.util.Date;
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
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "invoice")
public class Invoice {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer invoiceID;		
	@ManyToOne @JoinColumn(name = "userID")
	User user;
	@Temporal(TemporalType.DATE)
	@Column(name = "createDate")
	private Date createDate = new Date();
	@Column(name = "`address`")
	private String address	;
	@OneToMany(mappedBy = "invoice")
	List<InvoiceDetail> invoiceDetails;
}
