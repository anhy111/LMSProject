package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.service.LoginService;

@Controller
@PreAuthorize("hasAnyRole('ROLE_STUDENT', 'ROLE_MANAGER', 'ROLE_PROFESSOR')")
public class MemberController {

	@Autowired
	LoginService loginService;
	
	
	@GetMapping("/test/home")
	public String test() {
		
		
		return "test/home";
	}
	
	
}
