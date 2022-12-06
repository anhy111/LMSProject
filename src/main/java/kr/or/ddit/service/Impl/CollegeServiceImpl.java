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
	//단과대학 상세
	@Override
	public College CollegeDetail(int colCd) {
		return this.collegeMapper.CollegeDetail(colCd);
		}
	// 단과대학 수정
	@Override
	public  int CollegeUpdate(College college) {
		return this.collegeMapper.CollegeUpdate(college);
	}
	// 단과대학 정보삭제
	@Override
	public int CollegeDelete(int colCd) {
		return this.collegeMapper.CollegeDelete(colCd);
	}
	// 단과대학 등록
	@Override
	public int CollegeRegist(College college) {
		return this.collegeMapper.CollegeRegist(college);
	}
}
