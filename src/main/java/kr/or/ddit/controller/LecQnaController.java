package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecQna;
import kr.or.ddit.service.LecQnaService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lecture")
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class LecQnaController {
	@Autowired
	LecQnaService lecQnaService;
	
	@GetMapping("/qna")
	public String LectureNoticeList(Model model) {
			List<LecQna> lectureQnaList = this.lecQnaService.LecQnaList();
			
			//공통 약속
			model.addAttribute("lectureQnaList", lectureQnaList);
			
			//forwarding
			return "lecture/qna";
	}
	
}
