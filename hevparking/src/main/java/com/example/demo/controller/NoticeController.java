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

import com.example.demo.service.NoticeService;
import com.example.demo.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지 list
	@GetMapping("/noticelist")
	@ResponseBody
	public List<NoticeVO> noticeList() {

		List<NoticeVO> noticeList = noticeService.noticeList();

		return noticeList;
	}

	// 공지 등록
	@PostMapping("/noticeinsert")
	public String noticeinsert(@RequestBody NoticeVO noticeVo) {

		noticeService.noticeinsert(noticeVo);

		return "/noticeBoard";
	}

	// 공지 삭제
	@DeleteMapping("/noticedelete")
	public ResponseEntity<String> noticeDelete(@RequestParam int noticeCode, String noticePw) {

		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNoticeCode(noticeCode);
		noticeVo.setNoticePw(noticePw);

		boolean deldata = noticeService.deleteData(noticeVo);

		if (deldata) {
			return ResponseEntity.ok("공지 삭제 완료");
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	// 공지 수정
	@PostMapping("/noticeupdate")
	public ResponseEntity<String> noticeupdate(@RequestParam int noticeCode, @RequestParam String noticeType,
			@RequestParam String noticeTitle, @RequestParam String noticeContent) {

		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNoticeCode(noticeCode);
		noticeVo.setNoticeType(noticeType);
		noticeVo.setNoticeTitle(noticeTitle);
		noticeVo.setNoticeContent(noticeContent);

		boolean result = noticeService.noticeupdate(noticeVo);

		if (result) {
			return ResponseEntity.ok("공지사항이 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(500).body("공지사항 업데이트 도중 문제가 발생하였습니다.");
		}
	}
}