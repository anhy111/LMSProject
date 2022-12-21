package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Department;

public interface DepartmentMapper {

	//결재 요청 목록
    List<Department> departmentList();

	List<Department> departmentListByCollege(int colCd);

	int register(Department department);

	Department departmentDetail(Department department);

	int delete(Department department);

	int update(Department department);
}
