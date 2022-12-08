package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;

public interface LectureApplyMapper {

	// 교수 상세
	public Professor proInfo(int proNo);

	// 학년 / 학기
	public List<LecApply> getYrNSem(int proNo);

	// 제출된 강의계획서 리스트
	public List<LecApply> list(Map<String, Object> map);

	// 강의 개수 불러오기
	public int getCnt(Map<String, Object> map);
}
