package com.example.demo.vo;

import lombok.Data;

@Data
public class ParkingResVO {
	
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
	
	private MemberVO memberVO;
	private CardVO cardVO;
	private CardpaymentVO cardpaymentVO;
	private AccTransformVO accTransformVO;
	private ChargeResVO chargeResVO;
	private ChargeVO chargeVO;

}
