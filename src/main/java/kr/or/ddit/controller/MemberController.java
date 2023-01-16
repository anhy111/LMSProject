package kr.or.ddit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@PreAuthorize("hasAnyRole('ROLE_STUDENT', 'ROLE_MANAGER', 'ROLE_PROFESSOR')")
public class MemberController {
	
	@GetMapping("/test/home")
	public String test() {
		
		
		return "test/home";
	}
	
	
}
