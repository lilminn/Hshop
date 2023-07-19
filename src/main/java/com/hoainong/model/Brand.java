package com.hoainong.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "brand")
public class Brand {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer brandID;
	@Column(name = "`name`")
	private String name;
	@OneToMany(mappedBy = "brand")
	List<Product> products;
}
