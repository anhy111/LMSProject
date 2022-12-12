package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Student;

public interface ManageMapper  {

	List<Student> studentList();

	Student detailStu(Map<String, String> map);

}
