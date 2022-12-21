package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Professor;

public interface DepartmentMapper {

	//결재 요청 목록
	public List<Department> departmentList();

	public List<Department> departmentListByCollege(int colCd);

	public int register(Department department);

	public Department departmentDetail(Department department);

	public int delete(Department department);

	public int update(Department department);
	
	public int validationDepartmentName(String depNm);
	
	// 학과장 선택시 교수 검색
	public Professor searchProfessor(Department department);
}
