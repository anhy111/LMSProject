package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Student;

public interface ManageService {

	//학생 리스트
	public List<Student> studentList(int viewPage);
	
	//키워드별 검색한 학생 리스트
	public List<Student> stuSearch(Map<String, String> map);
	
	public Student detailStu(Map<String, String> map);

	public int deleteStu(Map<String, String> map);
	
	public int deleteMemStu(Map<String, String> map);

	public int updateStu(Student student);

	//학적 검색
	public List<Student> recordSearch(Map<String, String> map);

	public Student recordManagePost(Map<String, String> map);

	public int yesOrNo(Map<String, String> map);

	public Member createEmpId();

	public int createMember(Employee employee);

	public int createEmployee(Employee employee);

	public int createProfessor(Employee employee);

	public List<Employee> employeeList(int viewPage);

	public Employee detailEmp(Map<String, String> map);

	public int deleteMemEmp(Map<String, String> map);

	public int deleteEmp(Map<String, String> map);

	public int deletePro(Map<String, String> map);

	public int updateEmp(Employee employee);

	public List<Evaluation> evaluationList();

	public Evaluation evaluationCon(Map<String, String> map);

	public List<Evaluation> mineEvlList(String no);

	public int stuPaging();

	public int empPaging();

	

}
