package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
	
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/main")
	public String ApprovalList(Model model, HttpServletRequest req) {
		int empNo = (int)req.getSession().getAttribute("no");
		Approval approval = new Approval();
		approval.setEmpNo(empNo);
		List<Approval> approvalList = this.approvalService.approvalList(approval);
		log.info("approvalList : " + approvalList);
		
		//공통 약속
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("bodyTitle","결재");
		//forwarding
		return "approval/main";
	}
}
