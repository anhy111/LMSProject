package kr.or.ddit.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Record;
import kr.or.ddit.service.RecordService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/record")
public class RecordController {

	@Autowired
	RecordService recordService;
	
	@GetMapping("/apply")
	public String RecordApply(Principal principal, Model model) {
		model.addAttribute("bodyTitle", "신청");
		//로그인된 학생 아이디 가져오기 
		int stuNo = Integer.parseInt(principal.getName());
		model.addAttribute("stuNo", stuNo);
		log.info("학번들어왔니 : " + stuNo);
		
		//forwarding
		return "record/apply";
	}
	
	@PostMapping("/applyPost")
	public String RecordApplyPost(@ModelAttribute Record record) {
		this.recordService.RecordApply(record);
		//신청 완료시 신청 내역 페이지(아직 안만듬)로 리다이렉트하게 구현예정 
		return "redirect:/record/apply";
	}
}
