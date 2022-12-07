package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Lecture;

public interface LectureMapper {

	//강의 목록 조회
		public List<Lecture> lectureSearch(String keyword);
		
		public List<Lecture> professorLecture(String professorId);
}
