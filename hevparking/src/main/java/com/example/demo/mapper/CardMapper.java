package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CardVO;

@Mapper
public interface CardMapper {

	// 카드 등록
	public int cardRegistration(CardVO cardVo);

	// 등록된 카드 삭제
	public int cardDelete(CardVO cardVo);

	// 카드 정보 조회
	public List<CardVO> getcardInfo();

	// 예약된 카드정보 삭제
	public int resCarddelete(CardVO cardVo);

	// 등록된 카드정보 + 예약된 카드정보 조회
	public List<CardVO> CardAndCardPayment();

}