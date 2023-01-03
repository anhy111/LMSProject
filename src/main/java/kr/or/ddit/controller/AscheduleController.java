package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/aschedule")
@Slf4j
@Controller
public class AscheduleController {

	@GetMapping("/calendar")
	public String calendar() {
		return "aschedule/calendar";
	}
	
}
