package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Subject;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.service.LectureApplyService;

@Service
@Transactional
public class LectureApplyServiceImpl implements LectureApplyService {

    @Autowired
    LectureApplyMapper lectureApplyMapper;

    @Override
    public Professor proInfo(int proNo) {
        return this.lectureApplyMapper.proInfo(proNo);
    }
    
    @Override
    public Professor inquiryFormPriInfoStudentApply(int lecaCd) {
    	return null;
    }

	@Override
	public List<LecApply> getYrNSem(int proNo) {
		return this.lectureApplyMapper.getYrNSem(proNo);
	}
    
	@Override
	public List<LecApply> list(Map<String, Object> map) {
		return this.lectureApplyMapper.list(map);
	}
	
	@Override
	public int getCnt(Map<String, Object> map) {
		return this.lectureApplyMapper.getCnt(map);
	}
	
	@Override
	public Professor inquiryFormProInfo(int proNo) {
		return this.lectureApplyMapper.inquiryFormProInfo(proNo);
	}
	
	@Override
	public List<LecApply> inquiryFormLecApInfo(int lecaCd) {
		return this.lectureApplyMapper.inquiryFormLecApInfo(lecaCd);
	}
	
	@Override
	public List<Weekplan> inquiryWeekPlan(int lecaCd) {
		return this.lectureApplyMapper.inquiryWeekPlan(lecaCd);
	}
	
	@Override
	public int lectureSubmit(LecApply subCd) {
		return this.lectureApplyMapper.lectureSubmit(subCd);
	}

	@Override
	public int lecApplySubmit(LecApply lecaCd) {
		return this.lectureApplyMapper.lecApplySubmit(lecaCd);
	}
	
	@Override
	public int weekPlanSubmit(List<Weekplan> weekPlanList) {
		return this.lectureApplyMapper.weekPlanSubmit(weekPlanList);
	}

	@Override
	public int lecApplyTempSubmit(LecApply lecaCd) {
		return this.lectureApplyMapper.lecApplyTempSubmit(lecaCd);
	}

	@Override
	public List<LecApply> tempList(int proNo) {
		return this.lectureApplyMapper.tempList(proNo);
	}

	@Override
	public List<LecApply> tempFormLecApInfo(int lecaCd) {
		return this.lectureApplyMapper.tempFormLecApInfo(lecaCd);
	}
	
	@Override
	//임시저장한 강의 수정하기
	public int lectureUpdate(LecApply subCd) {
		return this.lectureApplyMapper.lectureUpdate(subCd);
	}
	
	@Override
	//임시저장한 강의계획서 수정하기
	public int lecApplyUpdate(LecApply lecaCd) {
		return this.lectureApplyMapper.lecApplyUpdate(lecaCd);
	}
	
	@Override
	//임시저장한 주차계획 수정하기
	public int weekPlanUpdate(List<Weekplan> weekPlanList) {
		return this.lectureApplyMapper.weekPlanUpdate(weekPlanList);
	}

	@Override
	public int temporarySubmit(LecApply lecaCd) {
		return this.lectureApplyMapper.temporarySubmit(lecaCd);
	}

	@Override
	public int deleteLecApply(int lecaCd) {
		int result = 0;
		result += this.lectureApplyMapper.weekPlanDelete(lecaCd);
		result += this.lectureApplyMapper.lecApplyDelete(lecaCd);
		result += this.lectureApplyMapper.lectureDelete(lecaCd);
		
		return result;
	}
	
	@Override
	public List<Subject> subList(int proNo) {
		return this.lectureApplyMapper.subList(proNo);
	}
	
	@Override
	public int getSubCdList(String subNm) {
		return this.lectureApplyMapper.getSubCdList(subNm);
	}
    
}
