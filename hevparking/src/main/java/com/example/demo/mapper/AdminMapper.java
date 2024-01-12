package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.AdminVO;


@Mapper
public interface AdminMapper {
	
	// 관리자 로그인
	public AdminVO adminlogin(AdminVO adminVo);
	
}