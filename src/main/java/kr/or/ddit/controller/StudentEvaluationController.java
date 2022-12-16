package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student/evaluation")
@Controller
public class StudentEvaluationController {

	@GetMapping("/list")
	public String list() {
		return "student/evaluation/evaluationList";
	}
	
	
}
