package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.vo.AdminVO;


@Service
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	// 관리자 로그인
	public AdminVO adminlogin(AdminVO adminVo) {
		// TODO Auto-generated method stub
		return adminMapper.adminlogin(adminVo);
	}
	
	

}
