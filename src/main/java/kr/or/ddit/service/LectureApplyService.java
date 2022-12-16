package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Subject;
import kr.or.ddit.domain.Weekplan;

public interface LectureApplyService {

	public Professor proInfo(int proNo);

	public List<LecApply> getYrNSem(int proNo);

	public List<LecApply> list(Map<String, Object> map);

	public int getCnt(Map<String, Object> map);

	public Professor inquiryFormProInfo(int proNo);

	public List<LecApply> inquiryFormLecApInfo(int lecaCd);

	public List<Weekplan> inquiryWeekPlan(int lecaCd);

	public int lectureSubmit(LecApply subCd);

	public int lecApplySubmit(LecApply lecaCd);

	public int weekPlanSubmit(List<String> weekPlanList);
	
	public List<LecApply> tempList(int proNo);

	public List<Subject> subList(int proNo);

	public int getSubCdList(String subNm);


}
