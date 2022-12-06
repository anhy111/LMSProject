package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/test/home")
	public String test() {
		

		return "test/home";
	}
	
}
