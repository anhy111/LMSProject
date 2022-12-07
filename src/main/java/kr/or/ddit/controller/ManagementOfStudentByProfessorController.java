package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.ManagementOfStudentByProfessorService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	@GetMapping("/detail")
	public String StudentDetail(int stuNo, Model model) {
		Student studentDetail = this.managementOfStudentByProfessorService.StudentDetail(stuNo);
		log.info("학생상세 : " + studentDetail.toString());
		
		//공통 약속
		model.addAttribute("bodyTitle","학생정보상세");
		model.addAttribute("studentDetail", studentDetail);
		
		//forwarding
		return "professor/management/detail";
	}
}
