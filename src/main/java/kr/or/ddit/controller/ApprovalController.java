package kr.or.ddit.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.service.ApprovalService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	ApprovalService approvalService;
	
	@GetMapping("/main")
	public String ApprovalList(Model model) {
		List<Approval> ApprovalList = this.approvalService.ApprovalList();
		log.info("ApprovalList : " + ApprovalList);
		
		//공통 약속
		model.addAttribute("bodyTitle","결재요청목록");
		model.addAttribute("ApprovalList", ApprovalList);
		
		//forwarding
		return "approval/main";
	}
}
