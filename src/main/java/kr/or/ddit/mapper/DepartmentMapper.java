package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;

public interface DepartmentMapper {
	
	//결재 요청 목록
	public List<Department> departmentList();
}
