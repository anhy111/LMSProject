package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Professor;

public interface DepartmentService {

	//학과 목록
    public List<Department> departmentList();

    public int register(Department department);
	
    public List<Department> departmentByCollegeList(int colCd);

    public Department departmentDetail(Department department);

    public int delete(Department department);

    public int update(Department department);
	
    public int validationDepartmentName(String depNm);
    
    public Professor searchProfessor(Department department);
}
