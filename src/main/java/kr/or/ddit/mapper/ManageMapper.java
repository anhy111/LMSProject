package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Student;

public interface ManageMapper  {
	
	public List<Student> studentList();
	
	public Student detailStu(Map<String, String> map);
	
	public int deleteStu(Map<String, String> map);
	
	public int updateStu(Student student);
	
}
