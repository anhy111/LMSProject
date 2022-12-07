package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.service.LectureApplyService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/student/lectureApply")
@Slf4j
@Controller
public class StudentLectureApplyController {

	@Autowired
	LectureApplyService lectureApplyService;
	
	@GetMapping("/list")
	public String lectureList(Model model) {
		
//		List<LecApply> list = lectureApplyService.list();
		
//		model.addAttribute("list",list);
		
		return "student/lectureApply/lectureList";
	}
} 
