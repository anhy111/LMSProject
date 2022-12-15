package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;

public interface DepartmentService {

	//학과 목록
    List<Department> departmentList();

	List<Department> departmentListByCollege(Department department);

	int register(Department department);

	Department departmentDetail(Department department);
}
