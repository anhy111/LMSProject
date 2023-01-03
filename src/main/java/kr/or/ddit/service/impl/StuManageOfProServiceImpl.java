package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.StuManageOfProMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StuManageOfProServiceImpl implements StuManageOfProService{

	@Autowired
	StuManageOfProMapper stuManageOfProMapper;
	
	@Autowired
	ApprovalService approvalService;
	
	@Override
	public List<Student> stuList(int depCd){
		return this.stuManageOfProMapper.stuList(depCd);
	}
	
	@Override
	public List<Student> myStuSearch(Map<String, String> map){
		return this.stuManageOfProMapper.myStuSearch(map);
	}
	
	@Override
	public List<SclHistory> stuSclList(Map<String, String> map){
		return this.stuManageOfProMapper.stuSclList(map);
	}
	
	@Override
	public int recommendationStu(Map<String, String> map) {
		return this.stuManageOfProMapper.recommendationStu(map);
	}
	
	@Override
	public List<SclHistory> schStuList(Map<String, String> map){
		return this.stuManageOfProMapper.schStuList(map);
	}
	
	@Override
	public Student schStuRcmd(Map<String, String> map) {
		return this.stuManageOfProMapper.schStuRcmd(map);
	}
	
	@Transactional
	@Override
	public int deanRecommendation(Map<String, String> map, HttpServletRequest req) {
		
		int deanRecommendation = this.stuManageOfProMapper.deanRecommendation(map);
		
		if(deanRecommendation <= 0 ) {
			new RuntimeException();
		}
		
		int proNo = (int) req.getSession().getAttribute("no");
		int sclhCd = Integer.parseInt(map.get("sclhCd"));

		Approval approval = new Approval();
		approval.setProNo(proNo);
		approval.setApprTagCd(sclhCd);
		approval.setApprCate("APC002");
		int approvalResult = this.approvalService.insertApproval(approval);
		if (approvalResult <= 0) {
			log.info("approval실패");
			new RuntimeException();
		}
		
		return approvalResult;
	}
	
	@Override
	public int rejectRcmd(Map<String, String> map) {
		return this.stuManageOfProMapper.rejectRcmd(map);
	}
	
}
