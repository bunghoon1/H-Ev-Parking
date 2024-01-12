package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CardService;
import com.example.demo.vo.CardVO;

@Controller
public class CardController {

	@Autowired
	private CardService cardService;

	// 카드 등록 insert
	@PostMapping("/cardregistration")
	public String cardRegistration(@RequestBody CardVO cardVo) {

		cardService.cardRegistration(cardVo);

		return "/index";
	}
	
	// 등록된 카드 delete
	@DeleteMapping("/cardDelete")
	public ResponseEntity<String> cardDelete(@RequestParam int cardCode, int memCode) {

		CardVO cardVo = new CardVO();
		cardVo.setCardCode(cardCode);
		cardVo.setMemCode(memCode);

		boolean deldata = cardService.cardDelete(cardVo);

		if (deldata) {
			return ResponseEntity.ok("등록된 회원 카드 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	// 카드 정보 조회
	@GetMapping("/getcardInfo")
	@ResponseBody
	public List<CardVO> getcardInfo() {

		List<CardVO> cardlist = cardService.getcardInfo();
		return cardlist;
	}
	
	// 등록된 카드정보 + 예약된 카드정보 조회
	@GetMapping("/CardAndCardPayment")
	@ResponseBody
	public List<CardVO> CardAndCardPayment() {

		List<CardVO> cardlist = cardService.CardAndCardPayment();
		return cardlist;
	}
	
	// 결제된 카드정보 삭제
	@DeleteMapping("/resCarddelete")
	public ResponseEntity<String> resCardDelete(@RequestParam int memCode) {

		CardVO cardVo = new CardVO();
		cardVo.setMemCode(memCode);

		boolean deldata = cardService.resCarddelete(cardVo);

		if (deldata) {
			return ResponseEntity.ok("예약된 회원 카드 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

}