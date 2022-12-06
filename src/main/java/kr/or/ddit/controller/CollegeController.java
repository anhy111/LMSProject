package kr.or.ddit.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		//공통 약속
		model.addAttribute("bodyTitle","단과대학");
		model.addAttribute("collegeList", collegeList);
		
		//forwarding
		return "college/main";
	}
	
	@GetMapping("/detail")
	public String CollegeDetail(int colCd, Model model) {
		College collgeDetail = this.collegeService.CollegeDetail(colCd);
		
		//공통 약속
		model.addAttribute("bodyTitle","단과대학상세");
		model.addAttribute("collgeDetail", collgeDetail);
		
		//forwarding
		return "college/detail";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_STUDENT', 'ROLE_PROFESSOR', 'ROLE_MANAGER')")
	@PostMapping("/updatePost")
	public String updatePost(@ModelAttribute  College college) {
		log.info("업데이트");
		log.info("college : " + college.toString() );
		
		this.collegeService.CollegeUpdate(college);
		return "redirect:/college/detail?colCd="+college.getColCd();
		}
	
}
