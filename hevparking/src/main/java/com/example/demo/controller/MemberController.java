package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.MemberandCarInfoDTO;
import com.example.demo.service.MemberService;
import com.example.demo.vo.CarInfoVO;
import com.example.demo.vo.MemberVO;

@Controller
@RequestMapping
public class MemberController {

	@Autowired
	private MemberService memberService;

	/* --------------------------------- 회 원 가 입 ---------------------------------- */

	// 회원가입 insert
	@PostMapping(value = "/signup")
	public String signForm(MemberVO memberVo, CarInfoVO carinfoVo, RedirectAttributes RA) {

		int memcnt = memberService.insertMember(memberVo);
		int carcnt = memberService.insertCarinfo(carinfoVo);

		if (memcnt == 1 && carcnt == 1) {
			RA.addFlashAttribute("회원 가입이 완료 되었습니다.");
		} else {
			RA.addFlashAttribute("회원 가입에 실패하였습니다.");
		}

		return "login";
	}

	// 아이디 중복 체크
	@PostMapping(value = "/checkid")
	@ResponseBody
	public int checkid(@RequestBody MemberVO memberVo) {

		int cnt = memberService.checkid(memberVo);
		return cnt;
	}

	// 차량 번호 중복 체크
	@PostMapping(value = "/checkcarnum")
	@ResponseBody
	public int checkcarnum(@RequestBody CarInfoVO carinfoVo) {

		int carcnt = memberService.checkcarnum(carinfoVo);
		return carcnt;
	}

	/* ----------------------------------------- 로 그 인 --------------------------------------- */

	// 회원 로그인 요청
	@PostMapping("/login")
	@ResponseBody
	public String loginForm(@RequestBody MemberVO memberVo, HttpSession session) {

		MemberVO memberinfo = memberService.login(memberVo);
		if (memberinfo != null) {
			session.setAttribute("MemberVO", memberinfo);
			return "success";
		} else {
			return "fail";
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("MemberVO");
		return "redirect:/";
	}

	/* -------------------------------------- 내정보 변경 업데이트 --------------------------------*/

	// 회원정보 조회
	@GetMapping("/MemberDataGet")
	@ResponseBody
	public List<MemberVO> MemberDataGet(MemberVO memberVo) {

		List<MemberVO> memData = memberService.MemberDataGet(memberVo);

		return memData;
	}

	// 회원 기본정보 업데이트
	@PostMapping("/memInfoUpdate")
	@Transactional
	public ResponseEntity<String> memInfoUpdate(@RequestBody MemberandCarInfoDTO memberAndCarInfoDTO) {
		try {
	        MemberVO memberVo = new MemberVO();
	        CarInfoVO carinfoVo = new CarInfoVO();
	        
	        memberVo.setMemCode(memberAndCarInfoDTO.getMemCode());
	        memberVo.setAddr1(memberAndCarInfoDTO.getAddr1());
	        memberVo.setAddr2(memberAndCarInfoDTO.getAddr2());
	        memberVo.setEmail(memberAndCarInfoDTO.getEmail());
	        memberVo.setPhone(memberAndCarInfoDTO.getPhone());
	        
	        carinfoVo.setMemCode(memberAndCarInfoDTO.getMemCode());
	        carinfoVo.setCarCategory(memberAndCarInfoDTO.getCarCategory());
	        carinfoVo.setCarName(memberAndCarInfoDTO.getCarName());
	        carinfoVo.setCarNum(memberAndCarInfoDTO.getCarNum());
	        
	        boolean updateResult = memberService.memInfoUpdate(memberVo);
	        boolean updateResultCar = memberService.carInfoUpdate(carinfoVo);

	        if (updateResult && updateResultCar) {
	            return ResponseEntity.ok("회원 정보가 업데이트되었습니다.");
	        } else {
	            throw new RuntimeException("회원정보 업데이트 도중 문제가 발생하였습니다.");
	        }
	    } catch (Exception e) {
	        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 트랜잭션 롤백
	        return ResponseEntity.status(500).body("회원정보 업데이트 도중 문제가 발생하였습니다.");
	    }
	}

	// 회원 비밀번호 업데이트
	@PostMapping("/PasswrodChange")
	public ResponseEntity<String> PasswrodChange(@RequestParam int memCode, @RequestParam String memPw) {

		MemberVO memVo = new MemberVO();
		memVo.setMemPw(memPw);
		memVo.setMemCode(memCode);

		boolean updateResult = memberService.PasswrodChange(memVo);

		if (updateResult) {
			return ResponseEntity.ok("비밀번호가 업데이트되었습니다.");
		} else {
			return ResponseEntity.status(500).body("비밀번호 업데이트 도중 문제가 발생하였습니다.");
		}
	}
}