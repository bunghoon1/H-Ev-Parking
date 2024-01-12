package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ChargeResMapper;
import com.example.demo.vo.ChargeResVO;

@Service
public class ChargeResService {

	@Autowired
	private ChargeResMapper chargeResMapper;

	// 충전기 사용 예약 insert
	public void chargeResinsert(ChargeResVO chargeresVo) {
		try {
			chargeResMapper.chargeResinsert(chargeresVo);
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw e;
		}

	}

	// 충전기 예약 delete
	public boolean chargeResdelete(ChargeResVO chresVo) {
		int delcnt = chargeResMapper.chargeResdelete(chresVo);

		return delcnt > 0;
	}

}
