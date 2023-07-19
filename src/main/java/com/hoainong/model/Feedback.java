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
@Table(name = "feedback")
public class Feedback {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer feedbackID;
	@ManyToOne @JoinColumn(name = "userID")
	User user;
	@Column(name = "`content`")
	private String content;		
}
