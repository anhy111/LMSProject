package kr.or.ddit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/department")
@Controller
public class DepartmentController {
	
	@PreAuthorize("hasRole('ROLG_MANAGER')")
	@GetMapping("/list")
	public String list() {
		return "department/departmentList";
	}
}
