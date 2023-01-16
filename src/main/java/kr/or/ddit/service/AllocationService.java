package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Allocation;
import kr.or.ddit.domain.StudentLecture;

public interface AllocationService {
	// 학생이 수강신청한 강의시간표
	List<Allocation> studentApplyTimeTable(StudentLecture studentLecture);
	
	// 학생이 장바구니에 담은 강의시간표
	List<Allocation> studentSaveTimeTable(StudentLecture studentLecture);
	
	int insertTimeTable(List<Allocation> allocationList);

	int deleteTimeTable(int lecaCd);
}
