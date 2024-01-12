package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ChargeMapper;
import com.example.demo.vo.ChargeVO;


@Service
public class ChargeService {
	
	@Autowired
	private ChargeMapper chargeMapper;
	
	// 충전기 정보 
	public ChargeVO chargeinfo(String chargeloc) {
	
		return chargeMapper.chargeinfo(chargeloc);
	}

	public String chargestate(ChargeVO chargeVo) {
		
		return chargeMapper.chargestate(chargeVo);
	}

}
