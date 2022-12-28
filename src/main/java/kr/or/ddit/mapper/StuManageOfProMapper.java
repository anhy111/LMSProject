package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;

public interface StuManageOfProMapper {

	public List<Student> stuList(int depCd);
	
	public List<SclHistory> stuSclList(Map<String, String> map);
	
	public int recommendationStu(Map<String, String> map);
	
	public List<SclHistory> schStuList();
	
	public Student schStuRcmd(Map<String, String> map);
	
}
