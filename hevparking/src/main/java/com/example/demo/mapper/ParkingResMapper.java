package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ParkingAndChargeRequest;
import com.example.demo.vo.ParkingResVO;


@Mapper
public interface ParkingResMapper {

	// 주차 정보 불러오기
	public List<ParkingResVO> prsDateGet(ParkingResVO parkingresVo);
	
	// 주차예약 insert(prsCode 반환)
	public void insertParkingRes(ParkingAndChargeRequest parkingResVO);
	
	//예약 코드 조회
	public ParkingResVO getPrsCode(String prsLocation, String memCode, String startDate, String endDate);
	
	//예약완료시 예약일 업데이트
	public int updateDate(ParkingResVO parkingresVo);
	
	// 예약일 만료시 업데이트
	public int updateEndParking(ParkingResVO parkingResVO);
	
	// 마이페이지 주차예약,카드,계좌이체 정보 조회
	public List<ParkingResVO> parkingList();

	// 주차 예약 취소
	public int parkinglistdelete(ParkingResVO prsVo);

	


	
	

	

	

}