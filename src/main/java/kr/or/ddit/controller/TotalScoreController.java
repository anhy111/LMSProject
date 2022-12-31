package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/totalScore")
public class TotalScoreController {
	
	@GetMapping("totalScore")
	public String totalScoreGet() {
		return "totalScore/totalScore";
	}
	@GetMapping("currentScore")
	public String pcurrentScoreGet() {
		return "totalScore/currentScore";
	}
	@GetMapping("preAppeal")
	public String preAppealGet() {
		return "totalScore/preAppeal";
	}
}
