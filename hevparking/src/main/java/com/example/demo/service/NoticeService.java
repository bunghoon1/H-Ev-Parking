package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.NoticeMapper;
import com.example.demo.vo.NoticeVO;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeDao;

	public void noticeinsert(NoticeVO noticeVo) {
		try {
			noticeDao.noticeinsert(noticeVo);
		} catch (DataAccessException e) {
			
			e.printStackTrace();
			throw e;
		}

	}
	
	// 공지 리스트
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return noticeDao.noticeList();
	}
	
	// 공지 삭제
	public boolean deleteData(NoticeVO noticeVo) {
		
		int delnotice = noticeDao.deleteData(noticeVo);
		
		return delnotice>0;
	}
	
	// 공지 업데이트
	public boolean noticeupdate(NoticeVO noticeVo) {

		int updatecnt = noticeDao.noticeupdate(noticeVo);
		
		return updatecnt>0;
	}

}
