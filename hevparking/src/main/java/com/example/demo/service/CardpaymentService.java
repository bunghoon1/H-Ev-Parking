package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.CardpaymentMapper;
import com.example.demo.vo.CardpaymentVO;


@Service
public class CardpaymentService {
	
	@Autowired
	private CardpaymentMapper cardpaymentMapper;
	
	// 카드 결제
	public void paymentinsert(CardpaymentVO cardpaymentVo) {
		try {
			cardpaymentMapper.paymentinsert(cardpaymentVo);
		} catch (DataAccessException e) {
			System.out.println("카드 결제 실패! 롤백됨");
			e.printStackTrace();
			throw e;
		}

	}

	public boolean paymentdelete(CardpaymentVO cardpaymentVo) {
		
		int delcnt = cardpaymentMapper.paymentdelete(cardpaymentVo);
		
		return delcnt>0;
	}

	public List<CardpaymentVO> cardpaymentInfo() {


		return cardpaymentMapper.cardpaymentInfo();
	}
}
