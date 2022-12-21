package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Student;

public interface ManageService {

	public List<Student> studentList();

	public Student detailStu(Map<String, String> map);

	public int deleteStu(Map<String, String> map);
	
	public int deleteMemStu(Map<String, String> map);

	public int updateStu(Student student);

	public List<Student> recordManage();

	public Student recordManagePost(Map<String, String> map);

	public int yesOrNo(Map<String, String> map);

	public Member createEmpId();

	public int createMember(Employee employee);

	public int createEmployee(Employee employee);

	public int createProfessor(Employee employee);

	public List<Employee> employeeList();

	public Employee detailEmp(Map<String, String> map);

	public int deleteMemEmp(Map<String, String> map);

	public int deleteEmp(Map<String, String> map);

	public int deletePro(Map<String, String> map);

	public int updateEmp(Employee employee);

	public List<Evaluation> evaluationList();

	public Evaluation evaluationCon(Map<String, String> map);

	public List<Evaluation> contentsList(Map<String, String> map);

	
	
}
