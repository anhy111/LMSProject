package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.College;
import kr.or.ddit.service.CollegeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/college")
public class CollegeController {

	@Autowired
	CollegeService collegeService;
	
	@GetMapping("/main")
	public String CollegeList(Model model) {
		List<College> collegeList = this.collegeService.CollegeList();
		log.info("collegeList : " + collegeList);
		
		//공통 약속
		model.addAttribute("bodyTitle","단과대학");
		model.addAttribute("collegeList", collegeList);
		
		//forwarding
		return "college/main";
	}
}
