package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MainMapper;


@Service
public class MainService {
	
	@Autowired
	private MainMapper mainMapper;
	
}
