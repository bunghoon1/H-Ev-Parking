package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.ChargeResService;
import com.example.demo.vo.ChargeResVO;

@Controller
@RequestMapping
public class ChargeResController {

	@Autowired
	private ChargeResService chargeresService;

	// 주차 예약 후 충전기 예약 insert(충전기 사용할시)
	@PostMapping(value = "/chargeresinsert")
	public String chargeResinsert(@RequestBody ChargeResVO chargeresVo) {
		
		chargeresService.chargeResinsert(chargeresVo);

		return "/parkingResPayment";
	}

}