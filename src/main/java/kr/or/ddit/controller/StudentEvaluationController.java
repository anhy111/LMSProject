package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.EvaluationService;
import kr.or.ddit.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/student/evaluation")
@Controller
public class StudentEvaluationController {

	@Autowired
	EvaluationService evaluationService;
	@Autowired
	MemberService memberService;
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_MANAGER')")
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest req) {
		
		List<Evaluation> evaluationQList = this.evaluationService.evaluationQList();
		
		Evaluation evaluation = new Evaluation();
		int stuNo = (int)req.getSession().getAttribute("no");
		evaluation.setStuNo(stuNo);
		
		List<Evaluation> evaluationList = this.evaluationService.studentEvaluationList(evaluation);
		Student student = this.memberService.readStudent(stuNo);
		model.addAttribute("evaluationQList", evaluationQList);
		model.addAttribute("evaluationList",evaluationList);
		model.addAttribute("student",student);
		
		return "student/evaluation/evaluationList";
	}
	
	@ResponseBody
	@PostMapping("/register")
	public String register(@RequestBody Evaluation evaluation) {
		return this.evaluationService.register(evaluation) + "";
	}
	
}
