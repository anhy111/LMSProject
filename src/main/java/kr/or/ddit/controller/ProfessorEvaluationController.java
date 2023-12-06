package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.service.EvaluationService;
import kr.or.ddit.service.ManageService;
import kr.or.ddit.service.MemberService;

@RequestMapping("/professor/evaluation")
@Controller
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class ProfessorEvaluationController {
	
	@Autowired
	EvaluationService evaluationService;
	@Autowired
	ManageService manageService;
	
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/list")
	public String list(HttpServletRequest req, Model model) {
		
		Map<String,String> map = new HashMap<String, String>();
		int proNo = (int)req.getSession().getAttribute("no");
		map.put("empNo",proNo + "");
		Employee professor = this.manageService.detailEmp(map);
		
		model.addAttribute("professor",professor);
		
		return "professor/evaluation/evaluationList";
	}
}
