package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CardpaymentVO;


@Mapper
public interface CardpaymentMapper {

	public int paymentinsert(CardpaymentVO cardpaymentVo);

	public int paymentdelete(CardpaymentVO cardpaymentVo);

	public List<CardpaymentVO> cardpaymentInfo();
	
}