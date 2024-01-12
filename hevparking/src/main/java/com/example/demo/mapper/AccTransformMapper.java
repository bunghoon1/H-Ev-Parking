package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.AccTransformVO;


@Mapper
public interface AccTransformMapper {

	public int accinsert(AccTransformVO accVo);

	public int pkaccdelete(AccTransformVO accVo);
	
	
	
}