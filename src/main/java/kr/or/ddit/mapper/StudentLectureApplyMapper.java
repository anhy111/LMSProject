package kr.or.ddit.mapper;


import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyMapper {

	// 신청
    int apply(StudentLecture studentLecture);
	// 수강신청취소
    int applyCancel(StudentLecture studentLecture);
	// 수강인원체크
    int checkHeadcount(StudentLecture studentLecture);
	// 장바구니 담기
    int save(StudentLecture studentLecture);
	// 장바구니 담기 취소
    int saveCancel(StudentLecture studentLecture);
	int increaseHeadcount(StudentLecture studentLecture);
	int decreaseHeadcount(StudentLecture studentLecture);
	// 학생의 그동안 신청한 강의 + 현재 신청한 강의 < 졸업학점 일때만 수강신청 가능
    int maxCredit(StudentLecture studentLecture);
}
