package kr.or.ddit.service.impl;

import java.util.List;

import org.apache.velocity.runtime.Runtime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.service.AllocationService;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.LectureApplyService;
import kr.or.ddit.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import sun.util.logging.resources.logging;

@Slf4j
@Service
@EnableTransactionManagement
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	ApprovalMapper approvalMapper;
	@Autowired
	LectureApplyService lectureApplyService;
	@Autowired
	LectureService lectureService;
	@Autowired
	AllocationService allocationService;
	
	//결재 요청 목록
	@Override
	public List<Approval> approvalList(Approval approval){
		return this.approvalMapper.approvalList(approval);
	}
	
	@Override
	public int insertApproval(Approval approval) {
		return this.approvalMapper.insertApproval(approval);
	}
	
	@Override
	public int deleteApproval(Approval approval) {
		return this.approvalMapper.deleteApproval(approval);
	}
	
	@Override
	@Transactional
	public int updateApproval(Approval approval) {
		int resultApproval = this.approvalMapper.updateApproval(approval);
		if(resultApproval <= 0) {
			new RuntimeException();
		}
		
		Lecture lecture = new Lecture();
		lecture.setLecaCd(approval.getApprTagCd());
		lecture.setLecaYn(getLecaYn(approval.getApprYn()));
		lecture.setLecYn(getLecYn(approval.getApprYn()));
		int resultLecture = this.lectureService.approveLecture(lecture);
		if(resultLecture <= 0) {
			new RuntimeException();
		}
		
		int result = 0;
		if(approval.getApprYn().equals("AP001")) {
			result = this.allocationService.insertTimeTable(approval.getAllocationList());
		}else {
			result = this.allocationService.deleteTimeTable(approval.getApprTagCd());
		}
		log.info("result : " + result);
		if(result < 0) {
			new RuntimeException();
		}
		return result;
	}
	
	// 공통코드를 숫자로 치환해주는 함수
	private int getLecaYn(String apprYn) {
		if(apprYn.equals("AP001")) {
			return 1;
		}else if(apprYn.equals("AP003")) {
			return 2;
		}
		return 0;
	}
	
	// 공통코드를 YN으로 치환해주는 함수
	private String getLecYn(String apprYn) {
		if(apprYn.equals("AP001")) {
			return "Y";
		}
		return "N";
	}
}
