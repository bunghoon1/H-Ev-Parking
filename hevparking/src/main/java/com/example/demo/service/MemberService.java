package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.CarInfoVO;
import com.example.demo.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;

	// 회원가입
	public int insertMember(MemberVO insertmember) {
		return memberMapper.insertMember(insertmember);
	}
	
	// 차량 등록
	public int insertCarinfo(CarInfoVO carinfoVo) {
		return memberMapper.insertCarinfo(carinfoVo);
	}

	// 아이디 중복 체크
	public int checkid(MemberVO checkid) {
		int idcnt = memberMapper.checkid(checkid);
		return idcnt;
	}

	// 차량 중복 체크
	public int checkcarnum(CarInfoVO checkcarnum) {
		int carcnt = memberMapper.checkcarnum(checkcarnum);
		return carcnt;
	}

	// 로그인
	public MemberVO login(MemberVO memberVo) {

		return memberMapper.login(memberVo);
	}

	// 회원 정보 조회
	public List<MemberVO> MemberDataGet(MemberVO memberVo) {

		return memberMapper.MemberDataGet(memberVo);
	}

	// 회원 정보 변경 업데이트
	public boolean memInfoUpdate(MemberVO memberVo) {
		int updateinfo = memberMapper.memInfoUpdate(memberVo);
		return updateinfo > 0;
	}

	public boolean carInfoUpdate(CarInfoVO carinfoVo) {
		int updateinfo = memberMapper.carInfoUpdate(carinfoVo);
		return updateinfo > 0;
	}

	// 회원 비밀번호 업데이트
	public boolean PasswrodChange(MemberVO memVo) {
		int updatepass = memberMapper.PasswrodChange(memVo);
		return updatepass > 0;
	}

}
