package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ChargeResVO;


@Mapper
public interface ChargeResMapper {

	// 충전기 사용 예약 insert
	public void chargeResinsert(ChargeResVO chargeresVo);
	
	// 충전기 예약 delete
	public int chargeResdelete(ChargeResVO chargeresVo);
}