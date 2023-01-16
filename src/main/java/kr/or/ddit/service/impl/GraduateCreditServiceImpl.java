package kr.or.ddit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.GraduateCredit;
import kr.or.ddit.mapper.GraduateCreditMapper;
import kr.or.ddit.service.GraduateCreditService;

@Service
public class GraduateCreditServiceImpl implements GraduateCreditService {
	
	@Autowired
	GraduateCreditMapper graduateCreditMapper;
	
	@Override
	public GraduateCredit studentApplyMaxCredit(String stuNo) {
		return this.graduateCreditMapper.studentApplyMaxCredit(stuNo);
	}
}
