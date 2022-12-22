package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.StuManageOfProMapper;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StuManageOfProServiceImpl implements StuManageOfProService{

	@Autowired
	StuManageOfProMapper stuManageOfProMapper;
	
	@Override
	public List<Student> stuList(int depCd){
		return this.stuManageOfProMapper.stuList(depCd);
	}
	
}
