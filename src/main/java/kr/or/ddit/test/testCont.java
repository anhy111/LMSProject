package kr.or.ddit.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testCont {
	
	@GetMapping("/test/home")
	public String test() {
		return "test/home";
	}
	

}
