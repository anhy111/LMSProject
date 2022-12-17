package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.service.EvaluationService;

@RequestMapping("/student/evaluation")
@Controller
public class StudentEvaluationController {

	@Autowired
	EvaluationService evaluationService;
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_MANAGER')")
	@GetMapping("/list")
	public String list(Model model) {
		
		List<Evaluation> evaluationList = this.evaluationService.evaluationList();
		
		model.addAttribute("evaluationList", evaluationList);
		
		return "student/evaluation/evaluationList";
	}
	
	
}
