package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> departmentList() {
		return this.departmentMapper.departmentList();
	}
}
