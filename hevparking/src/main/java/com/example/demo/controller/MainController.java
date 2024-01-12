package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController {

	// 메인 페이지
	@GetMapping("/index")
	public String main() {
		return "/index";
	}

	// 로그인 페이지
	@GetMapping("/login")
	public String loginPage() {
		return "/login";
	}

	// 서브 페이지
	@GetMapping("/admin")
	public String admin() {
		return "/admin";
	}

	// 회원가입 개인정보 동의
	@GetMapping("/signupTerms")
	public String signupTerms() {
		return "/signupTerms";
	}

	// 회원가입
	@GetMapping("/signup")
	public String signup() {
		return "/signup";
	}

	// 내정보
	@GetMapping("/myInfo")
	public String myInfo() {
		return "/myInfo";
	}

	// 공지사항
	@GetMapping("/noticeBoard")
	public String noticeBoard() {
		return "/noticeBoard";
	}

	// 주차 예약 페이지
	@GetMapping("/parkingRes")
	public String parkingRes() {
		return "/parkingRes";
	}

	// 충전소 검색
	@GetMapping("/searchMap")
	public String map() {
		return "searchMap";
	}

}