package kr.or.ddit.mapper;


import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyMapper {
	
	// 신청
	public int apply(StudentLecture studentLecture);
	// 수강신청취소
	public int applyCancel(StudentLecture studentLecture);
	// 수강인원체크
	public int checkHeadcount(StudentLecture studentLecture);
	// 장바구니 담기
	public int save(StudentLecture studentLecture);
	// 장바구니 담기 취소
	public int saveCancel(StudentLecture studentLecture);
	public int increaseHeadcount(StudentLecture studentLecture);
	public int decreaseHeadcount(StudentLecture studentLecture);
	// 학생의 그동안 신청한 강의 + 현재 신청한 강의 < 졸업학점 일때만 수강신청 가능
	public int maxCredit(StudentLecture studentLecture);
}
