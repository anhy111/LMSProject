package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.College;
import kr.or.ddit.service.CollegeService;

@RequestMapping("/department")
@Controller
public class DepartmentController {
	
	@Autowired
	CollegeService collegeService;
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/list")
	public String list(Model model) {
		
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("collegeList",collegeList);
		
		return "department/departmentList";
	}
}
