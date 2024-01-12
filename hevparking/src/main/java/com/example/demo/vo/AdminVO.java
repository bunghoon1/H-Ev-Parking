package com.example.demo.vo;

import lombok.Data;

@Data
public class AdminVO {
	
    private String adminId;
    private String adminPw;
    private String adminName;
    
    private NoticeVO noticeVO;
   
}
