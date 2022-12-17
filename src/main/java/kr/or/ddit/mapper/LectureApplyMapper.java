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

	// 강의계획서 강의 테이블
	public int lectureSubmit(LecApply subCd);

	// 강의계획서 강의계획서 테이블
	public int lecApplySubmit(LecApply lecaCd);
	
	// 강의계획서 주차계획 테이블
	public int weekPlanSubmit(List<String> weekPlanList);
	
	// 강의계획서 임시저장 테이블
	public int lecApplyTempSubmit(LecApply lecaCd);
	
	// 임시저장 리스트
	public List<LecApply> tempList(int proNo);
	
	
	
	// 임시저장 강의계획서 상세페이지 기본사항,상세내용
	public List<LecApply> tempFormLecApInfo(int lecaCd);

	// 과목명 리스트 가져오기
	public List<Subject> subList(int proNo);

	// 과목번호 리스트 가져오기
	public int getSubCdList(String subNm);
	
}
