package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminService;
import com.example.demo.vo.AdminVO;

@Controller
@RequestMapping
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 관리자 로그인 요청
	@PostMapping("/adminlogin")
	@ResponseBody
	public String adminlogin(@RequestBody AdminVO adminVo, HttpSession session) {

		AdminVO admininfo = adminService.adminlogin(adminVo);

		if (admininfo != null) {
			session.setAttribute("AdminVO", admininfo);
			return "success";
		} else {
			return "fail";
		}
	}

	// 로그아웃
	@GetMapping("/adminlogout")
	public String logout(HttpSession session) {
		session.removeAttribute("AdminVO");
		return "/login";
	}

}