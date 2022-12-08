package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;

public interface LectureMapper {

	//강의 목록 조회
	public List<Lecture> lectureSearch(String keyword);
	
	public List<Lecture> professorLecture(String professorId);
	
	// 학생이 수강신청하지 않은 강의 리스트
	public List<Lecture> studentNotYetApplyLectureList(StudentLecture studentLecture);
	
	// 학생이 수강신청한 강의 리스트
	public List<Lecture> studentCompleteApplyLectureList(StudentLecture studentLecture);
	
	// 학생이 수강신청후 수강인원증가
	public int increaseHeadcount(StudentLecture studentLecture);
}
