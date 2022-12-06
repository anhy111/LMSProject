package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Lecture;


public interface LectureService {

	//강의 목록 조회
	public List<Lecture> lectureSearch();

}
