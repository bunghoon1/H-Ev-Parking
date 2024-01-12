package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CarInfoVO;
import com.example.demo.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// 회원가입
	public int insertMember(MemberVO signupvo);

	public int insertCarinfo(CarInfoVO carinfovo);

	// 아이디,차량번호 중복체크
	public int checkid(MemberVO memberVo);

	public int checkcarnum(CarInfoVO carinfoVo);

	// 로그인
	public MemberVO login(MemberVO memberVo);

	// 회원정보 조회
	public List<MemberVO> MemberDataGet(MemberVO memberVo);

	// 회원정보 수정(회원)
	public int memInfoUpdate(MemberVO memberVo);
	
	// 회원정보 수정(차량)
	public int carInfoUpdate(CarInfoVO carinfoVo);
	
	// 회원 비밀번호 업데이트
	public int PasswrodChange(MemberVO memVo);

	
	


	
}