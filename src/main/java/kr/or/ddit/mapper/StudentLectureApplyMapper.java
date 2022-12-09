package kr.or.ddit.mapper;


import kr.or.ddit.domain.StudentLecture;

public interface StudentLectureApplyMapper {
	
	//신청
	public int apply(StudentLecture studentLecture);
	
	//수강인원체크
	public int checkHeadcount(StudentLecture studentLecture);
}
