package kr.or.ddit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.ASchedule;
import kr.or.ddit.service.AScheduleService;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/aschedule")
@Slf4j
@Controller
public class AscheduleController {
	
	@Autowired
	AScheduleService aScheduleService;

	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/calendar")
	public String calendar(Model model, HttpSession session) {
		
		model.addAttribute("bodyTitle","학사일정");
		model.addAttribute("empNo",(int)session.getAttribute("no"));
		return "aschedule/calendar";
	}
	
	@ResponseBody 
	@PostMapping("/register")
	public ASchedule register(@RequestBody ASchedule aSchedule) {
		log.info("AscheduleController.register.aSchedule : " + aSchedule);
		int result = this.aScheduleService.register(aSchedule);
		if(result < 0) {
			return null;
		}
		return aSchedule;
	}
	
}
