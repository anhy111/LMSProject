package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Allocation;
import kr.or.ddit.domain.StudentLecture;

public interface AllocationMapper {

	// 학생이 수강신청한 강의시간표
    List<Allocation> studentApplyTimeTable(StudentLecture studentLecture);
    
    // 학생 장바구니의 강의시간표
    List<Allocation> studentSaveTimeTable(StudentLecture studentLecture);
}
