package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecNotice;
import kr.or.ddit.service.LecNoticeService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/lecture")
public class LecNoticeController {
	
	@Autowired
	LecNoticeService lecNoticeService;
	
	@GetMapping("/notice")
	public String LectureNoticeList(Model model) {
			List<LecNotice> lectureNoticeList = this.lecNoticeService.LectureNoticeList();
			
			//공통 약속
			model.addAttribute("bodyTitle","공지사항목록");
			model.addAttribute("lectureNoticeList", lectureNoticeList);
			
			//forwarding
			return "lecture/notice";
	}
	
}
