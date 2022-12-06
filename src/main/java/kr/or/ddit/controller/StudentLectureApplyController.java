package kr.or.ddit.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student")
public class StudentLectureApplyController {

	@GetMapping("/lectureApply")
	public String lectureList() {
		
		return "lectureApply/lectureList";
	}
}
