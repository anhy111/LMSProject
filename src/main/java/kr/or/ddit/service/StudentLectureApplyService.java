package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyService {

	//신청
	public int apply(StudentLecture studentLecture);

}
