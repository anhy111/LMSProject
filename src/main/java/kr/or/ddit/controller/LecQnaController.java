package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class LecQnaController {
	@Autowired
	LecQnaService lecQnaService;
	
	@GetMapping("/qna")
	public String LectureNoticeList(Model model) {
			List<LecQna> LectureQnaList = this.lecQnaService.LecQnaList();
			log.info("LectureQnaList : " + LectureQnaList);
			
			//공통 약속
			model.addAttribute("bodyTitle","질문게시판");
			model.addAttribute("LectureQnaList", LectureQnaList);
			
			//forwarding
			return "lecture/qna";
	}
	
}
