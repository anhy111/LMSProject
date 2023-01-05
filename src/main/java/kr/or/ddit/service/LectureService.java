package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.domain.Task;
import kr.or.ddit.domain.TaskSubmit;
import kr.or.ddit.domain.student.StudentLectureForm;


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
	//강의 과제 수정
	public int taskUpdate(HashMap<String, Object> map);
	//강의 과제 삭제
	public int deleteTask(String lecaCd,String taskCd); 
	//과제 제출 목록
	public List<Task> taskSubmitList(String tsubCd);
	//학생이 과제 제출 했는지 체크
	public TaskSubmit stuSubmitCheck(TaskSubmit taskSubmit);
	//과제 제출
	public int insertTaskSubmit1(TaskSubmit taskSubmit);
	public int insertTaskSubmit2(TaskSubmit taskSubmit);
	
	//제출 과제 디테일
	public Task submitDetail(HashMap<String, Object> map);
	//제출 과제 수정
	public int taskSubmitUpdate(HashMap<String, Object> map);
	//제출 과제 삭제
	public int submitDelete(int tsubCd);
	//과제 점수 입력
	public int scoreUpdate(TaskSubmit tasksubmit);

	public List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture);
	public List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture);

	// 장바구니에 담기고 학생이 수강신청하지 않은 강의
	public List<Lecture> loadNotApplySaveLecture(StudentLecture studentLecture);

	// 수강편람 강의 조회
	public List<Lecture> searchList(StudentLecture studentLecture);
	
	// 결재 시 강의 테이블 승인상태 변경
	public int approveLecture(Lecture lecture);

    List<StudentLectureForm> studentLectureSearchAll(String studentId);
}
