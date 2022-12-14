package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Subject;
import kr.or.ddit.domain.Weekplan;

public interface LectureApplyMapper {

	// 교수 상세
	public Professor proInfo(int proNo);

	// 학년 / 학기
	public List<LecApply> getYrNSem(int proNo);

	// 제출된 강의계획서 리스트
	public List<LecApply> list(Map<String, Object> map);

	// 강의 개수 불러오기
	public int getCnt(Map<String, Object> map);

	// 강의계획서 상세페이지 교수정보
	public Professor inquiryFormProInfo(int proNo);

	// 강의계획서 상세페이지 기본사항,상세내용
	public List<LecApply> inquiryFormLecApInfo(int lecaCd);

	// 강의계획서 상세페이지 주차별계획
	public List<Weekplan> inquiryWeekPlan(int lecaCd);

	// 강의계획서 과목 테이블
	public int subjectSubmit(LecApply proNo);
	
	// 강의계획서 강의 테이블
	public int lectureSubmit(LecApply subCd);

	// 강의계획서 강의계획서 테이블
	public int lecApplySubmit(LecApply lecaCd);
	
	// 강의계획서 주차계획 테이블
	public int weekPlanSubmit(Map<String, Object> map);
	
	// 최대 lecaCd 알아내기
	public int getMaxLecaCd();
	
	// 과목리스트 가져오기
	public List<Subject> subList();
	
}
