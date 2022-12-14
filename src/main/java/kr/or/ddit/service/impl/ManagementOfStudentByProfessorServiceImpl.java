package kr.or.ddit.service.impl;

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
	public List<Student> StudentList(int depCd){
		return this.managementOfStudentByProfessorMapper.StudentList(depCd);
	}
	//학생 상세
	@Override
	public Student StudentDetail(int stuNo) {
		return this.managementOfStudentByProfessorMapper.StudentDetail(stuNo);
	}
	
	
	
}
