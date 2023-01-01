package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.BuildingService;
import kr.or.ddit.service.LectureApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
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
	public List<Approval> list(HttpServletRequest req){
		int empNo = (int)req.getSession().getAttribute("no");
		Approval approval = new Approval();
		approval.setEmpNo(empNo);
		return this.approvalService.approvalList(approval);
	}
	
	//강의계획서 상세페이지 통합
	@GetMapping("/inquiryForm")
	public String inquiryFormStudent(Model model, int lecaCd) {
		
		log.info("상세 계획서 코드 : " + lecaCd);
		
		Professor professor = this.lectureApplyService.inquiryFormProInfoStudentApply(lecaCd);
		List<LecApply> lecApplyList = this.lectureApplyService.inquiryFormLecApInfo(lecaCd);
		List<Weekplan> weekPlanList = this.lectureApplyService.inquiryWeekPlan(lecaCd);
		List<Building> buildingList = this.buildingService.buildingByProfessorList(professor.getProNo());
		
		model.addAttribute("buildingList",buildingList);
		
		model.addAttribute("professor", professor);
		model.addAttribute("lecApplyList", lecApplyList);
		model.addAttribute("weekPlanList", weekPlanList);
		
		return "professor/lecApplyForm/inquiryForm";
	}
	
}
