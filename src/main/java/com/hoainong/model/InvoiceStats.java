package com.hoainong.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InvoiceStats {
	private Integer year;
    private Integer month;
    private Double totalAmount;
    
    
}
