package com.example.demo.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeCode;
	private String adminId;
	private String noticeTitle;
	private String noticeType;
	private String noticeContent;
	private int noticeCnt;
	private String createDate;
	private String noticePw;
}
