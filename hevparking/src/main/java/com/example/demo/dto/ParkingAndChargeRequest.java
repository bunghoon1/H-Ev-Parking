package com.example.demo.dto;

import lombok.Data;

@Data
public class ParkingAndChargeRequest {
	private int prsCode;
	private int memCode;
	private String prsLocation;
	private String prsArea;
	private String prsType;
	private String prsDate;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String paymentType;
	private String parkingStatus;
	private String price;
	private String chargeUse;
	private String comment;
	
	private int chargeResCode;
	private int chargeCode;
	private String chargeTime;
	private String chargePrice;
}
