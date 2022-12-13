package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyService {

	//신청
    String apply(StudentLecture studentLecture);

	//수강신청취소
    int applyCancel(StudentLecture studentLecture);

	// 장바구니 담기
    String save(StudentLecture studentLecture);
	// 장바구니 담기 취소
    int saveCancel(StudentLecture studentLecture);
}
