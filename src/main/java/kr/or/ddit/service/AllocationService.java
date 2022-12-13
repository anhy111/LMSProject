package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Allocation;
import kr.or.ddit.domain.StudentLecture;

public interface AllocationService {
	List<Allocation> studentApplyTimeTable(StudentLecture studentLecture);
}
