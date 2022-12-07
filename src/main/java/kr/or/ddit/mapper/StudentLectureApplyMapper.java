package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyMapper {
	
	//신청
	public int apply(StudentLecture studentLecture);
}
