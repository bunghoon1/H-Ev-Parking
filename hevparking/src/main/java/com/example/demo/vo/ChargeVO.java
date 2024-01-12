package com.example.demo.vo;

import lombok.Data;

@Data
public class ChargeVO {
	private int chargeCode;
	private String chargeLoc;
	private String chargeName;
	private String chargeState;
    private String chargeSpeed;
    private String chargeType;
    private String timePrice;
    private String chargeUsetime;
    
    private  ChargeResVO chargeResVO;
    
}
