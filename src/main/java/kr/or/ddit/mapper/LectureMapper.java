package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.domain.Task;
import kr.or.ddit.domain.TaskSubmit;

public interface LectureMapper {

	//강의 목록 조회
	public List<Lecture> lectureSearch(String keyword);
	// 교수가 담당한 강의 목록 조회
	public List<Lecture> professorLecture(String professorId);

	// 학생이 수강신청하지 않은 강의 리스트
	public List<Lecture> studentNotYetApplyLectureList(StudentLecture studentLecture);

	// 학생이 수강신청한 강의 리스트
	public List<Lecture> studentCompleteApplyLectureList(StudentLecture studentLecture);

	// 학생이 수강신청후 수강인원증가
	public int increaseHeadcount(StudentLecture studentLecture);

	// 강의 과제 목록 조회
	public Lecture searchTask(@Param("lecaCd")String lecaCd);

	// 강의 과제 등록(첨부파일 o)
	public int insertTask(Task task);

	// 강의 과제 등록(첨부파일 x)
	public int insertTask2(Task task);

	//강의 과제 상세조회
	public Task detailTask(@Param("taskCd") String taskCd,@Param("lecaCd") String lecaCd);
	//강의 과제 수정
	public int taskUpdate(HashMap<String, Object> map);

	//강의 과제 삭제
	public int deleteTask(@Param("lecaCd") String lecaCd,@Param("taskCd") String taskCd);

	public List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture);

	public List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture);
	
	//과제 제출 목록
	public List<Task> taskSubmitList(String tsubCd);
	//과제 제출
	public int insertTaskSubmit1(TaskSubmit taskSubmit);
	public int insertTaskSubmit2(TaskSubmit taskSubmit);
	
	//제출 과제 디테일
	public Task submitDetail(String tsubCd);	
	
	//제출 과제 수정
	public int taskSubmitUpdate(HashMap<String, Object> map);
	//과제 점수 입력
	public int scoreUpdate(int tsubScore, int tsubCd);
	
	// 학생의 장바구니에 담았지만 수강신청하지 않은 강의
	public List<Lecture> loadNotApplySaveLecture(StudentLecture studentLecture);

}
