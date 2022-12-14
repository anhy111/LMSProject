package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.service.LectureApplyService;

@Service
public class LectureApplyServiceImpl implements LectureApplyService {

    @Autowired
    LectureApplyMapper lectureApplyMapper;

    @Override
    public Professor proInfo(int proNo) {
        return this.lectureApplyMapper.proInfo(proNo);
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
	public int subjectSubmit(LecApply proNo) {
		return this.lectureApplyMapper.subjectSubmit(proNo);
	}
	
	@Override
	public int lectureSubmit(LecApply subCd) {
		return this.lectureApplyMapper.lectureSubmit(subCd);
	}

	@Override
	public int lecApplySubmit(LecApply lecaCd) {
		return this.lectureApplyMapper.lecApplySubmit(lecaCd);
	}
	
    
}
