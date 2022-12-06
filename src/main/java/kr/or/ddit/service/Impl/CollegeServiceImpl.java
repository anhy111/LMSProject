package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.College;
import kr.or.ddit.mapper.CollegeMapper;
import kr.or.ddit.service.CollegeService;

@Service
public class CollegeServiceImpl implements CollegeService {
	@Autowired
	CollegeMapper collegeMapper;
	
	//단과대학 목록
	@Override
	public List<College> CollegeList(){
		return this.collegeMapper.CollegeList();
	}
}
