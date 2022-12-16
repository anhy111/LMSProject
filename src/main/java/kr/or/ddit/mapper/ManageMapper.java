package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Student;

public interface ManageMapper  {
	
	public List<Student> studentList();
	
	public Student detailStu(Map<String, String> map);
	
	public int deleteStu(Map<String, String> map);
	
	public int updateStu(Student student);
	
	public List<Student> recordManage();
	
	public Student recordManagePost(Map<String, String> map);
	
	public int yesOrNo(Map<String, String> map);
	
	public Member createEmpId();
	
	public int createMember(Employee employee);
	
	public int createEmployee(Employee employee);
	
	public int createProfessor(Employee employee);
}
