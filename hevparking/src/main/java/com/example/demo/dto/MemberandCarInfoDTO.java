package com.example.demo.dto;

import lombok.Data;

@Data
public class MemberandCarInfoDTO {
	private int memCode;
    private String addr1;
    private String addr2;
    private String email;
    private String phone;
    private String carCategory;
    private String carName;
    private String carNum;
}
