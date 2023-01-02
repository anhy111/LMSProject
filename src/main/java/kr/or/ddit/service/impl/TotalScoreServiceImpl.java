package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.TotalScoreMapper;
import kr.or.ddit.service.TotalScoreService;


@Service
public class TotalScoreServiceImpl implements TotalScoreService {

	@Autowired
	TotalScoreMapper TSMapper;
	
	
	//총 건수 세기(성적 받은 건수)
	@Override
	public int getCount(HashMap<String, Object> map) {
		return this.TSMapper.getCount(map);
	}
	
	//학생 정보 가져오기
	@Override
	public Student getInfo(String stuNo) {
		return this.TSMapper.getInfo(stuNo);
	}
	
	//년도 및 학기 구하기
	@Override
	public List<LecApply> getYrAndSem(HashMap<String, Object> map) {
		return this.TSMapper.getYrAndSem(map);
	}
	@Override
	public HashMap<String, Object> getNow(){
		return this.TSMapper.getNow();
	}
	
	
	
	
	
	
	
	
}
