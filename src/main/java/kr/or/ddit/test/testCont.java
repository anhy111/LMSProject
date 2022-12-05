package kr.or.ddit.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Description;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.domain.Member;
import kr.or.ddit.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class testCont {


	@GetMapping("/th")
	public String testThymeleaf(Model model) {
		model.addAttribute("data", "data");
		return "action2";
	}
	
}
