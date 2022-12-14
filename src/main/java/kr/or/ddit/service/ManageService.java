package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Student;

public interface ManageService {

	public List<Student> studentList();

	public Student detailStu(Map<String, String> map);

	public int deleteStu(Map<String, String> map);

	public int updateStu(Student student);

	public List<Student> recordManage();
	
}
