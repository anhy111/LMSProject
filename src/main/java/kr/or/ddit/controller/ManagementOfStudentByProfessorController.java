package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.ManagementOfStudentByProfessorService;

@Controller
@RequestMapping("/professor/management")
public class ManagementOfStudentByProfessorController {

	@Autowired
	ManagementOfStudentByProfessorService managementOfStudentByProfessorService;
	
	@GetMapping("/main")
	public String StudentList(Model model) {
		List<Student> studentList = this.managementOfStudentByProfessorService.StudentList();
		
		//공통 약속
		model.addAttribute("bodyTitle","학생관리");
		model.addAttribute("studentList", studentList);
		
		//forwarding
		return "professor/management/main";
	}
}
