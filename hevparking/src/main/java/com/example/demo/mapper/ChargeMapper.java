package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ChargeVO;


@Mapper
public interface ChargeMapper {

	//충전기 정보
	public ChargeVO chargeinfo(String chargeloc);

	public String chargestate(ChargeVO chargeVo);
	
	
	

}