package kr.or.ddit.domain;

import java.util.List;

import lombok.Data;

@Data
public class AllTimeLectures {
	private List<Lecture> lectureList;
	private List<LecApply> lecApplyList;
	private List<Subject> subjectList;
	private List<Department> departmentList;
	private List<College> collegeList;
	private List<Professor> professorList;
	private List<Employee> employeeList;
	
}
