package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyService {

	//신청
	public String apply(StudentLecture studentLecture);

	//수강신청취소
	public int applyCancel(StudentLecture studentLecture);
	
	// 장바구니 담기
	public String save(StudentLecture studentLecture);
	// 장바구니 담기 취소
	public int saveCancel(StudentLecture studentLecture);
}
