package kr.or.ddit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String StudentList(Principal principal, HttpServletRequest request, Model model) {
		//로그인된 교수 아이디 가져오기 1)
		int professorId = Integer.parseInt(principal.getName());
		
		//로그인된 교수 아이디 가져오기 2)
		HttpSession session = request.getSession();
		int depCd = (int)session.getAttribute("no");
		
		
		List<Student> studentList = this.managementOfStudentByProfessorService.StudentList(professorId);
		
		//공통 약속
		model.addAttribute("studentList", studentList);
		
		//forwarding
		return "professor/management/main";
	}
	
	@GetMapping("/detail")
	public String StudentDetail(int stuNo, Model model) {
		Student studentDetail = this.managementOfStudentByProfessorService.StudentDetail(stuNo);
		log.info("학생상세 : " + studentDetail.toString());
		
		//공통 약속
		model.addAttribute("studentDetail", studentDetail);
		
		//forwarding
		return "professor/management/detail";
	}
}
