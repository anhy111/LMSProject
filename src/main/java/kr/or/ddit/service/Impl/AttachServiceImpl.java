package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Attach;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.AttachMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.AttachService;

@Service
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	AttachMapper attachMapper;
	
	@Override
	public int insertAttch(Attach attach) {
		return this.attachMapper.insertAttch(attach);
	}
}
