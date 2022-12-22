package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.KeyIndicators;
import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.DepartmentService;
import kr.or.ddit.service.KeyIndicatorsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/ketIndicators")
@Controller
public class KeyIndicatorsController {

	@Autowired
	CollegeService collegeService;
	@Autowired
	DepartmentService departmentService;
	@Autowired
	KeyIndicatorsService keyIndicatorsService;
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/chart")
	public String charts(Model model) {
		
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("collegeList", collegeList);
		
		return "chart/keyIndicators";
	}
	
	@ResponseBody
	@GetMapping("/departmentByCollege")
	public List<Department> departmentByCollege(int colCd){
		return this.departmentService.departmentByCollegeList(colCd);
	}
	
	@ResponseBody
	@GetMapping("/recruitmentRateChart")
	public List<KeyIndicators> recruitmentRateChart(KeyIndicators keyIndicators){
		return this.keyIndicatorsService.recruitmentRateList(keyIndicators);
	}
}
