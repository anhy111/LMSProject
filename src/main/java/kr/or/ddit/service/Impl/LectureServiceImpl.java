package kr.or.ddit.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentLecture;
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
	@Override
	public List<Lecture> studentCompleteSaveLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentCompleteSaveLectureList(studentLecture);
	}
	@Override
	public List<Lecture> studentNotYetSaveLectureList(StudentLecture studentLecture) {
		return this.lectureMapper.studentNotYetSaveLectureList(studentLecture);
	}
}
