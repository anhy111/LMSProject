package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.service.ApprovalService;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	ApprovalMapper approvalMapper;
	
	//결재 요청 목록
	@Override
	public List<Approval> ApprovalList(){
		return this.approvalMapper.ApprovalList();
	}
}
