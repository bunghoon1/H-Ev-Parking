package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.ParkingAndChargeRequest;
import com.example.demo.mapper.ParkingResMapper;
import com.example.demo.vo.ParkingResVO;

@Service
public class ParkingResService {

	@Autowired
	private ParkingResMapper parkingresMapper;

	// 주차 예약 데이터 불러오기
	public List<ParkingResVO> prsDateGet(ParkingResVO parkingresVo) {

		return parkingresMapper.prsDateGet(parkingresVo);
	}

	// 주차예약 insert(prsCode 반환)
	@Transactional
	public int insertParkingRes(ParkingAndChargeRequest parkingResVO) {
		try {
			parkingresMapper.insertParkingRes(parkingResVO);
			return parkingResVO.getPrsCode();
		} catch (DataAccessException e) {
			System.out.println("주차 insert 실패! service");
			e.printStackTrace();
			throw e;
		}
	}

	// 예약 완료시 예약일 업데이트
	public boolean updateDate(ParkingResVO parkingResVO) {

		int rowsAffected = parkingresMapper.updateDate(parkingResVO);

		return rowsAffected > 0;
	}
	
	// 예약일 만료시 업데이트
	public boolean updateEndParking(ParkingResVO parkingResVO) {
		int rowsAffected = parkingresMapper.updateEndParking(parkingResVO);

		return rowsAffected > 0;
	}

	// 마이페이지 주차예약,카드,계좌이체 정보 조회
	public List<ParkingResVO> parkingList() {
		// TODO Auto-generated method stub
		return parkingresMapper.parkingList();
	}

	// 주차 예약 취소
	public boolean parkinglistdelete(ParkingResVO prsVo) {
		int dellist = parkingresMapper.parkinglistdelete(prsVo);

		return dellist > 0;
	}
}
