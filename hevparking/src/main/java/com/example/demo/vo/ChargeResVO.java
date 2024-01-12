package com.example.demo.vo;

import lombok.Data;

@Data
public class ChargeResVO {
	private int chargeResCode;
	private int prsCode;
	private int chargeCode;
	private String chargeTime;
	private String chargePrice;
	
	private ChargeVO chargeVO;
}
