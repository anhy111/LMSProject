package kr.or.ddit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.domain.Task;


public interface LectureService {

	//강의 목록 조회
	public List<Lecture> lectureSearch(String keyword);

	public List<Lecture> professorLecture(String professorId);
	// 학생이 수강신청하지 않은 강의 리스트
	public List<Lecture> studentNotYetApplyLectureList(StudentLecture studentLecture);
	
	// 학생이 수강신청한 강의 리스트
	public List<Lecture> studentCompleteApplyLectureList(StudentLecture studentLecture);
	//과제목록 조회
	public Lecture searchTask(String lecaCd);
	//강의 과제 등록(첨부파일 없을 때)
	public int insertTask2(Task task);
	// 강의 과제 등록(첨부파일 o)
	public int insertTask(Task task);
	//강의 과제 상세조회
	public Task detailTask(String taskCd, String lecaCd);
	//강의 과제 삭제
	public int deleteTask(String lecaCd,String taskCd); 

	public List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture);
	public List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture);
}
