package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Student;

public interface ManagementOfStudentByProfessorService {

	//학생 조회
    List<Student> StudentList(int depCd);
	//학생 상세
    Student StudentDetail(int stuNo);

}
