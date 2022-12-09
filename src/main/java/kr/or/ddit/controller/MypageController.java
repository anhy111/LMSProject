package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/mypage/mypage")
	public String mypage(int memNo, Model model) {
		
		log.info("memNo는?? " + memNo);
		
		Student student = this.memberService.readStudent(memNo);
		
		model.addAttribute("student", student);
		
		return "mypage/mypage";
	}

}
