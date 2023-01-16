package kr.or.ddit.service.impl;

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
	
	@Override
	public List<Allocation> studentSaveTimeTable(StudentLecture studentLecture) {
		return this.allocationMapper.studentSaveTimeTable(studentLecture);
	}
	
	@Override
	public int insertTimeTable(List<Allocation> allocationList) {
		return this.allocationMapper.insertTimeTable(allocationList);
	}
	
	@Override
	public int deleteTimeTable(int lecaCd) {
		return this.allocationMapper.deledeleteTimeTable(lecaCd);
	}
}
