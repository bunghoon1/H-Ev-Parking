package com.example.demo.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;

@Data
public class MemberVO {
	
	private int memCode;
    private String memId;
    private String memPw;
    private String email;
    private String memName;
    private String phone;
    private String addr1;
    private String addr2;
    private Date date;
    
    @Getter
    private CarInfoVO carInfo;
}
