package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Student;

public interface StuManageOfProMapper {

	public List<Student> stuList(int depCd);
	
}
