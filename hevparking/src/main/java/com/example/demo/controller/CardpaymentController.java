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

import com.example.demo.service.CardpaymentService;
import com.example.demo.vo.CardpaymentVO;

@Controller
public class CardpaymentController {

	@Autowired
	private CardpaymentService cardpaymentService;

	// 카드 결제 정보 조회
	@GetMapping("/getcardpaymentInfo")
	@ResponseBody
	public List<CardpaymentVO> cardpaymentInfo() {

		List<CardpaymentVO> cardpaymentInfo = cardpaymentService.cardpaymentInfo();
		return cardpaymentInfo;
	}

	// 카드 결제 insert
	@PostMapping(value = "/cardpayment")
	public String paymentinsert(@RequestBody CardpaymentVO cardpaymentVo) {

		cardpaymentService.paymentinsert(cardpaymentVo);

		return "index";
	}

	// 예약시 결제된 카드 정보 삭제
	@DeleteMapping("/cardpaymentdel")
	public ResponseEntity<String> paymentdelete(@RequestParam int prsCode) {

		CardpaymentVO cardpaymentVo = new CardpaymentVO();
		cardpaymentVo.setPrsCode(prsCode);

		boolean deldata = cardpaymentService.paymentdelete(cardpaymentVo);

		if (deldata) {
			return ResponseEntity.ok("주차예약 연결된 카드 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

}