package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AccTransformMapper;
import com.example.demo.vo.AccTransformVO;


@Service
public class AccTransformService {
	
	@Autowired
	private AccTransformMapper acctrnsformMapper;
	
	// 주차 예약 계좌이체
	public void accinsert(AccTransformVO accVo) {
		try {
			acctrnsformMapper.accinsert(accVo);
		} catch (DataAccessException e) {
			System.out.println("계좌이체 실패! 롤백됨");
			e.printStackTrace();
			throw e;
		}

	}
	
	// 메인화면 주차예약 delete
	public boolean pkaccdelete(AccTransformVO accVo) {

		int delcnt = acctrnsformMapper.pkaccdelete(accVo);
		
		return delcnt>0;
	}
}
