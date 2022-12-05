package kr.or.ddit.test;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class testCont {


	@GetMapping("/test/home")
	public String test() {

		return "test/home";
	}

	@GetMapping("/th")
	public String testThymeleaf(Model model) {
		model.addAttribute("data", "data");
		return "action2";
	}
}
