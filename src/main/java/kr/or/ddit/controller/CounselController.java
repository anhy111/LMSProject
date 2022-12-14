package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Counsel;
import kr.or.ddit.service.CounselService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/counsel")
public class CounselController {
	@Autowired
	CounselService counselService;
	
	@GetMapping("/studentside/applyList")
	public String studentCounselApplyList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int stuNo = (int)session.getAttribute("no");
		List<Counsel> counselList = this.counselService.studentApplyList(stuNo);
		
		//공통 약속
		model.addAttribute("bodyTitle","상담");
		model.addAttribute("counselList", counselList);
		
		
		//forwarding
		return "counsel/studentside/applyList";
	}
	
	@GetMapping("/studentside/applyInsert")
	public String studentCounselApplyInsert(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		List<Counsel> professorList = this.counselService.listOfProfessor(stuNo);
		for(int i = 0; i < professorList.size(); i++) {
			for (Counsel counsel : professorList) {
				log.info("교수목록 가온나: " + counsel.getEmpNm());
			}
		}
		model.addAttribute("professorList", professorList);
		//forwarding
		return "counsel/studentside/applyInsert";
	}
	
	@PostMapping("/studentside/applyInsert")
	public String studentCounselApplyInsertPost(@ModelAttribute Counsel counsel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		counsel.setStuNo(stuNo);
		this.counselService.applyInsert(counsel);
		
		//forwarding
		return "counsel/studentside/applyList";
	}
	
	@GetMapping("/professorside/counselList")
	public String professorCounselList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int proNo = (int)session.getAttribute("no");
		List<Counsel> counselList = this.counselService.professorCounselList(proNo);
		
		//공통 약속
		model.addAttribute("bodyTitle","상담");
		model.addAttribute("counselList", counselList);
		
		//forwarding
		return "counsel/professorside/counselList";
	}
	
	@GetMapping("/professorside/answer")
	public String professorCounselAnswer(Model model) {
		//forwarding
		return "counsel/professorside/answer";
	}
	@PostMapping("/professorside/answer")
	public String professorCounselAnswerPost(@ModelAttribute Counsel counsel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		counsel.setProNo(proNo);

		this.counselService.applyAnswerUpdate(counsel);
		return "counsel/professorside/counselList";
	}
}
