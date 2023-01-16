package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.domain.student.StudentLectureForm;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.domain.Task;
import kr.or.ddit.domain.TaskSubmit;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.LectureService;

@Service
public class LectureServiceImpl implements LectureService{
	@Inject
	LectureMapper lectureMapper;
	
	
	//강의 목록 조회
	@Override
	public List<Lecture> lectureSearch(String keyword){
		return this.lectureMapper.lectureSearch(keyword);
	}
	
	@Override
	public List<Lecture> professorLecture(String professorId){

		return this.lectureMapper.professorLecture(professorId);
	}
	
	@Override
	public List<Lecture> studentCompleteApplyLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentCompleteApplyLectureList(studentLecture);
	}
	
	@Override
	public List<Lecture> studentNotYetApplyLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentNotYetApplyLectureList(studentLecture);
	}
	@Override
	public Lecture searchTask(String lecaCd){
		return this.lectureMapper.searchTask(lecaCd);
	}

	
	// 강의 과제 등록
	@Override
	public int insertTask2(Task task) {
		return this.lectureMapper.insertTask2(task);
	}
	
	// 강의 과제 등록(첨부파일 o)
	@Override
		public int insertTask(Task task) {
			return this.lectureMapper.insertTask(task);
		}
	
	//강의 과제 상세조회
	@Override
		public Task detailTask(String taskCd, String lecaCd) {
			return this.lectureMapper.detailTask(taskCd, lecaCd);
		}
	//강의 과제 수정
	@Override
	public int taskUpdate(HashMap<String, Object> map) {
		return this.lectureMapper.taskUpdate(map);
	}
	
	//강의 과제 삭제
	@Override
		public int deleteTask(String lecaCd,String taskCd) {
		return this.lectureMapper.deleteTask(lecaCd, taskCd);
	}

	@Override
	public List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentCompleteSaveLectureList(studentLecture);
	}
	@Override
	public List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentNotYetSaveLectureList(studentLecture);
	}
	
	@Override
	public List<Lecture> loadNotApplySaveLecture(StudentLecture studentLecture) {
		return this.lectureMapper.loadNotApplySaveLecture(studentLecture);
	}
	
	@Override
	public List<Lecture> searchList(StudentLecture studentLecture) {
		return this.lectureMapper.searchList(studentLecture);
	}

	@Override
	public List<StudentLectureForm> studentLectureSearchAll(String studentId) {
		return this.lectureMapper.studentLectureSearchAll(studentId);
	}

	//과제 제출 리스트
	@Override
	public List<Task> taskSubmitList(String tsubCd) {
		return this.lectureMapper.taskSubmitList(tsubCd);
	}
	
	//학생 과제 제출
	@Override
	public int insertTaskSubmit1(TaskSubmit taskSubmit) {
		return this.lectureMapper.insertTaskSubmit1(taskSubmit);
	}

	//학생 과제 제출
	@Override
	public int insertTaskSubmit2(TaskSubmit taskSubmit) {
		return this.lectureMapper.insertTaskSubmit2(taskSubmit);
	}
	//학생이 과제 제출 했는지 체크
	public TaskSubmit stuSubmitCheck(TaskSubmit taskSubmit) {
		return this.lectureMapper.stuSubmitCheck(taskSubmit);
	}
	//제출 과제 디테일
	@Override
	public Task submitDetail(HashMap<String, Object> map) {
		return this.lectureMapper.submitDetail(map);
		}
	//제출 과제 수정
	@Override
	public int taskSubmitUpdate(HashMap<String, Object> map) {
		return this.lectureMapper.taskSubmitUpdate(map);
	}
	//제출 과제 삭제
	@Override
	public int submitDelete(int tsubCd) {
		return this.lectureMapper.submitDelete(tsubCd);
	}
	//과제 점수 입력
	@Override
	public int scoreUpdate(TaskSubmit tasksubmit) {
		return this.lectureMapper.scoreUpdate(tasksubmit);
	}
	
	@Override
	public int approveLecture(Lecture lecture) {
		return this.lectureMapper.approveLecture(lecture);
	}
	
	@Override
	public int lectureListPaging(StudentLecture studentLecture) {
		return this.lectureMapper.lectureListPaging(studentLecture);
	}
}
