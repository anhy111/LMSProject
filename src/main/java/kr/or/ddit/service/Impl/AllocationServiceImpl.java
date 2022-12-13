package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Allocation;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.mapper.AllocationMapper;
import kr.or.ddit.service.AllocationService;

@Service
public class AllocationServiceImpl implements AllocationService {
	
	@Autowired
	AllocationMapper allocationMapper;
	
	@Override
	public List<Allocation> studentApplyTimeTable(StudentLecture studentLecture) {
		return this.allocationMapper.studentApplyTimeTable(studentLecture);
	}
}
