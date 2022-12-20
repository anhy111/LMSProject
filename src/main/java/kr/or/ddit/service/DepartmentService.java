package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;

public interface DepartmentService {

	//학과 목록
    List<Department> departmentList();

	int register(Department department);
	
	List<Department> departmentByCollegeList(int colCd);

	Department departmentDetail(Department department);

	int delete(Department department);

	int update(Department department);
}
