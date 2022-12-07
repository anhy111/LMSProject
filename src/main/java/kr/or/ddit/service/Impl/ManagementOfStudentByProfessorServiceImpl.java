package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.ManagementOfStudentByProfessorMapper;
import kr.or.ddit.service.ManagementOfStudentByProfessorService;

@Service
public class ManagementOfStudentByProfessorServiceImpl implements ManagementOfStudentByProfessorService{
	@Autowired
	ManagementOfStudentByProfessorMapper managementOfStudentByProfessorMapper;
	
	//학생 조회
	@Override
	public List<Student> StudentList(){
		return this.managementOfStudentByProfessorMapper.StudentList();
	}
	//학생 상세
	@Override
	public Student StudentDetail(int stuNo) {
		return this.managementOfStudentByProfessorMapper.StudentDetail(stuNo);
	}
	
	
	
}
