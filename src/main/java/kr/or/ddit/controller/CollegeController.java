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
import kr.or.ddit.domain.Department;
import kr.or.ddit.service.CollegeService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/college")
public class CollegeController {

	@Autowired
	CollegeService collegeService;
	
	@GetMapping("/main")
	public String CollegeList(Model model) {
		List<College> collegeList = this.collegeService.CollegeList();
		
		//공통 약속
		model.addAttribute("collegeList", collegeList);
		
		//forwarding
		return "college/main";
	}
	
	@GetMapping("/detail")
	public String CollegeDetail(int colCd, Model model) {
		College collgeDetail = this.collegeService.CollegeDetail(colCd);
		List<Department> departments = this.collegeService.DepartmentByCollegeList(colCd);
		
		//공통 약속
		model.addAttribute("collgeDetail", collgeDetail);
		model.addAttribute("departments", departments);
		
		//forwarding
		return "college/detail";
	}
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@PostMapping("/updatePost")
	public String updatePost(@ModelAttribute  College college) {
		
		
		this.collegeService.CollegeUpdate(college);
		return "redirect:/college/detail?colCd="+college.getColCd();
		}
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/delete")
	public String Delete(int colCd) {
		this.collegeService.CollegeDelete(colCd);
		
		return "redirect:/college/main";
	}
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/regist")
	public String CollegeRegist(Model model) {
		
		
		//forwarding
		return "college/regist";
	}
	
	@PostMapping("/registPost")
	public String RegistPost(@ModelAttribute College college) {
		
		this.collegeService.CollegeRegist(college);
		 
		return "redirect:/college/detail?colCd="+college.getColCd();
	}
	
}
