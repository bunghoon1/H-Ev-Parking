package com.example.demo.controller;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.ParkingAndChargeRequest;
import com.example.demo.service.ChargeResService;
import com.example.demo.service.ParkingResService;
import com.example.demo.vo.ChargeResVO;
import com.example.demo.vo.ParkingResVO;

@Controller
@RequestMapping
public class ParkingResController {

	@Autowired
	private ParkingResService parkingresService; // 주차예약 서비스

	@Autowired
	private ChargeResService chargeResService; // 충전예약 서비스

	// 주차 예약 정보 불러오기
	@GetMapping("/prsDateGet")
	@ResponseBody
	public List<ParkingResVO> prsDateGet(ParkingResVO parkingresVo) {

		List<ParkingResVO> checkdate = parkingresService.prsDateGet(parkingresVo);

		return checkdate;
	}

	// 마이페이지 주차예약,카드,계좌이체,회원정보,충전기,충전기예약 정보 조회
	@GetMapping("/parkingList")
	@ResponseBody
	public List<ParkingResVO> parkingList() {

		List<ParkingResVO> parkingList = parkingresService.parkingList();
		return parkingList;
	}

	// 주차예약 insert(prsCode 반환)
	@PostMapping("/parkResreturnPrsCode")
	@Transactional
	public ResponseEntity<Integer> parkResreturnPrsCode(@RequestBody ParkingAndChargeRequest parkingResVO, HttpSession session) {
		try {
			int generatedPrsCode = parkingresService.insertParkingRes(parkingResVO);
			
			session.setAttribute("prsCode", generatedPrsCode); // 세션에 예약 데이터 저장
			
			int memCode = parkingResVO.getMemCode();
	        session.setAttribute("memCode", memCode);

			return ResponseEntity.ok(generatedPrsCode);

		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);
		}
	}

	// 서버에 prsCode 안전하게 저장
	@PostMapping("/savePrsCode")
	public ResponseEntity<Object> savePrsCode(@RequestBody Map<String, Object> requestBody, HttpSession session) {
		try {
			// 클라이언트에서 전송된 prsCode를 가져옴
			int prsCode = (int) requestBody.get("prsCode");

			// 세션에 prsCode를 저장
			session.setAttribute("prsCode", prsCode);

			return ResponseEntity.ok().build(); // 저장이 성공했다는 응답 전송
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러 발생 시 응답 전송
		}
	}

	// 결제 페이지에 form값 불러오기
	@GetMapping("/parkingResPayment")
	@Transactional
	public String parkingResPayment(HttpSession session) {

		// session에 저장된 값 불러오기
		Integer prsCode = (Integer) session.getAttribute("prsCode");

		return "/parkingResPayment";
	}

	// 주차 예약 최종 날짜 업데이트
	@PostMapping("/updateResDate")
	public ResponseEntity<String> updateResDate(@RequestParam int prsCode, @RequestParam String prsDate,
			@RequestParam String paymentType, @RequestParam String parkingStatus) {

		ParkingResVO parkingResVO = new ParkingResVO();
		parkingResVO.setPrsCode(prsCode);
		parkingResVO.setPrsDate(prsDate);
		parkingResVO.setPaymentType(paymentType);
		parkingResVO.setParkingStatus(parkingStatus);

		boolean result = parkingresService.updateDate(parkingResVO);

		if (result) {
			return ResponseEntity.ok("예약 날짜가 성공적으로 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(500).body("예약 날짜 업데이트 중 오류가 발생했습니다.");
		}
	}

	// 주차 예약 만료시 업데이트
	@PostMapping("/endDateUpdate")
	public ResponseEntity<String> updateEndParking(@RequestParam int prsCode, @RequestParam String parkingStatus) {

		ParkingResVO parkingResVO = new ParkingResVO();
		parkingResVO.setPrsCode(prsCode);
		parkingResVO.setParkingStatus(parkingStatus);

		boolean result = parkingresService.updateEndParking(parkingResVO);

		if (result) {
			return ResponseEntity.ok("예약 종료일이 성공적으로 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(500).body("예약 종료일 업데이트 중 오류가 발생했습니다.");
		}
	}

	// 주차 예약 취소(주차만)
	@DeleteMapping("/parkinglistdelete")
	@Transactional
	public ResponseEntity<String> deleteParkingList(@RequestParam int prsCode, HttpSession session) {

		ParkingResVO prsVo = new ParkingResVO();
		prsVo.setPrsCode(prsCode);

		boolean parking = parkingresService.parkinglistdelete(prsVo);

		if (parking) {
			Enumeration<String> attributeNames = session.getAttributeNames();
			while (attributeNames.hasMoreElements()) {
				String attributeName = attributeNames.nextElement();
				// 세션에 있는 모든 속성을 삭제하고자 하는 경우, 특정 조건에 따라 원하는 속성을 제외하고 제거할 수 있습니다.
				if (!attributeName.equals("MemberVO")) {
					session.removeAttribute(attributeName);
				}
			}
			return ResponseEntity.ok("주차예약 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	// 주차 예약 취소(주차 + 충전기 예약)
	@DeleteMapping("/parkinglistandchargeRes")
	@Transactional
	public ResponseEntity<String> parkingListAndchargeRes(@RequestParam int prsCode, HttpSession session) {

		ChargeResVO chresVo = new ChargeResVO();
		ParkingResVO prsVo = new ParkingResVO();

		chresVo.setPrsCode(prsCode);
		prsVo.setPrsCode(prsCode);

		boolean chargeRes = chargeResService.chargeResdelete(chresVo);
		boolean parking = parkingresService.parkinglistdelete(prsVo);

		if (parking && chargeRes) {
			Enumeration<String> attributeNames = session.getAttributeNames();
			while (attributeNames.hasMoreElements()) {
				String attributeName = attributeNames.nextElement();
				// 세션에 있는 모든 속성을 삭제하고자 하는 경우, 특정 조건에 따라 원하는 속성을 제외하고 제거할 수 있습니다.
				if (!attributeName.equals("MemberVO")) {
					session.removeAttribute(attributeName);
				}
			}
			return ResponseEntity.ok("주차 + 충전예약 데이터 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}
}