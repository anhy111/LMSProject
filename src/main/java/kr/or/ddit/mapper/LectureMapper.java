package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;

public interface LectureMapper {

	//강의 목록 조회
    List<Lecture> lectureSearch(String keyword);

	List<Lecture> professorLecture(String professorId);

	// 학생이 수강신청하지 않은 강의 리스트
    List<Lecture> studentNotYetApplyLectureList(StudentLecture studentLecture);

	// 학생이 수강신청한 강의 리스트
    List<Lecture> studentCompleteApplyLectureList(StudentLecture studentLecture);

	// 학생이 수강신청후 수강인원증가
    int increaseHeadcount(StudentLecture studentLecture);

		Lecture searchTask(String lecaCd);

	List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture);

	List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture);
}
