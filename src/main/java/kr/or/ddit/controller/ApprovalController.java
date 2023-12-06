package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.BuildingService;
import kr.or.ddit.service.LectureApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class ApprovalController {
	@Autowired
	ApprovalService approvalService;
	@Autowired
	LectureApplyService lectureApplyService;
	@Autowired
	BuildingService buildingService;
	
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
	
	@ResponseBody
	@GetMapping("/list")
	public List<Approval> list(HttpServletRequest req, Approval approval){
		int empNo = (int)req.getSession().getAttribute("no");
		approval.setEmpNo(empNo);
		return this.approvalService.approvalList(approval);
	}
	
	@GetMapping("/lecApplyApproveForm")
	public String lecApplyApproveForm(Model model, int lecaCd) {
		
		Professor professor = this.lectureApplyService.proInfoByLecaCd(lecaCd);
		List<LecApply> lecApplyList = this.lectureApplyService.inquiryFormLecApInfo(lecaCd);
		Approval approval = this.lectureApplyService.getLecaApproval(lecaCd);
		List<Weekplan> weekPlanList = this.lectureApplyService.inquiryWeekPlan(lecaCd);
		List<Building> buildingList = this.buildingService.buildingByProfessorList(professor.getProNo());
		
		model.addAttribute("approval",approval);
		model.addAttribute("professor", professor);
		model.addAttribute("lecApplyList", lecApplyList);
		model.addAttribute("weekPlanList", weekPlanList);
		model.addAttribute("buildingList",buildingList);
		
		return "professor/lecApplyForm/ApprovalForm";
	}
	
	@ResponseBody
	@PostMapping("/updateApproval")
	public String updateApproval(@RequestBody Approval approval, HttpServletRequest req) {
		
		int empNo = (int)req.getSession().getAttribute("no");
		
		approval.setEmpNo(empNo);
		log.info("ApprovalController.updateApproval : " + approval);
		return this.approvalService.updateApproval(approval) + "";
	}
	
	@ResponseBody
	@GetMapping("/schStuDetail")
	public Student schStuDetail(Approval approval) {
		log.info("approval : " + approval);
		return this.approvalService.schStuDetail(approval);
	}
	
	@ResponseBody
	@GetMapping("/approvalCount")
	public String approvalCount(Approval approval) {
		log.info("ApprovalController.approvalCount.approval : " + approval);
		return this.approvalService.approvalListPaging(approval) + "";
	}
	
	
}
