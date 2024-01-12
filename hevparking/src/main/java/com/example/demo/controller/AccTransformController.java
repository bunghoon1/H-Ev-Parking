package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.AccTransformService;
import com.example.demo.vo.AccTransformVO;


@Controller
@RequestMapping
public class AccTransformController {
	
	@Autowired
	private AccTransformService AccService;
	
	// 계좌 등록
	@PostMapping(value ="/accinsert")
    public String accTransform(@RequestBody AccTransformVO accVo) {
        
		AccService.accinsert(accVo);
        
        return "index";
    }
	
	// 주차예약된 계좌번호 삭제
	@DeleteMapping("/pkaccdel")
	public ResponseEntity<String> pkaccdelete(@RequestParam int prsCode) {

		AccTransformVO accVo = new AccTransformVO();
		accVo.setPrsCode(prsCode);

		boolean deldata = AccService.pkaccdelete(accVo);

		if (deldata) {
			return ResponseEntity.ok("주차예약 연결된 계좌번호 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

}