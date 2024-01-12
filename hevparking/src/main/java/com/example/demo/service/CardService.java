package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.CardMapper;
import com.example.demo.vo.CardVO;

@Service
public class CardService {

	@Autowired
	private CardMapper cardMapper;

	// 카드 등록
	public void cardRegistration(CardVO cardVo) {
		try {
			cardMapper.cardRegistration(cardVo);
		} catch (DataAccessException e) {
			System.out.println("카드 결제 실패! 롤백됨");
			e.printStackTrace();
			throw e;
		}
	}

	// 등록된 카드 삭제
	public boolean cardDelete(CardVO cardVo) {

		int delcnt = cardMapper.cardDelete(cardVo);

		return delcnt > 0;
	}

	// 카드 정보 조회
	public List<CardVO> getcardInfo() {
		// TODO Auto-generated method stub
		return cardMapper.getcardInfo();
	}

	// 등록된 카드정보 + 예약된 카드정보 조회
	public List<CardVO> CardAndCardPayment() {

		return cardMapper.CardAndCardPayment();
	}

	// 예약된 카드정보 삭제
	public boolean resCarddelete(CardVO cardVo) {

		int delcnt = cardMapper.resCarddelete(cardVo);

		return delcnt > 0;
	}

}
