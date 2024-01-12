package com.example.demo.vo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.springframework.data.annotation.Id;

import lombok.Data;

@Data
public class CardVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cardCode;
    private int cardPass;
    private int memCode;
    private String cardName;
    private String cardNum;
    private String cardDate;
    private String cvc;
    
    
    private CardpaymentVO cardpaymentVO;
}
