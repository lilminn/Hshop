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
@Table(name = "gallery")
public class Gallery {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer galleryID;
	@ManyToOne @JoinColumn(name = "productID")
	Product product;
	@Column(name = "imageURL")
	private String imageURL;
	
}
