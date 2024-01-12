package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.NoticeVO;


@Mapper
public interface NoticeMapper {

	public void noticeinsert(NoticeVO noticeVo);

	public List<NoticeVO> noticeList();

	public int deleteData(NoticeVO noticeVo);

	public int noticeupdate(NoticeVO noticeVo);
	
	
}