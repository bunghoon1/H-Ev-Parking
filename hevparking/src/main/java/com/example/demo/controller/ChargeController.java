package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ChargeService;
import com.example.demo.vo.ChargeVO;


@Controller
@RequestMapping
public class ChargeController {
	
	@Autowired
	private ChargeService chargeService;
	
	// 실시간 충전기 상태 변화
	@PostMapping("/chargestate")
	@ResponseBody
	public String chargestate(@RequestBody ChargeVO chargeVo) {

		return chargeService.chargestate(chargeVo);
	}
	
	// 충전기 정보
	@GetMapping("/chargeinfo")
	public ResponseEntity<ChargeVO> chargeinfo(@RequestParam("chargeLoc") String chargeloc) {
		
		ChargeVO chargelocinfo = chargeService.chargeinfo(chargeloc);
		
		if (chargelocinfo != null) {
            return ResponseEntity.ok(chargelocinfo);
        } else {
            return ResponseEntity.notFound().build();
        }
	}
}