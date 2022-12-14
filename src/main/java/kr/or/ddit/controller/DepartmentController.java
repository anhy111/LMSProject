package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/department")
@Controller
public class DepartmentController {
	
	@GetMapping("/list")
	public String list() {
		return "department/departmentList";
	}
}
