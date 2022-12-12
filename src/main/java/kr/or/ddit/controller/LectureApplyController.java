package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.service.LectureApplyService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/professor")
public class LectureApplyController {
	
  @Autowired
  private LectureApplyService lectureApplyService;
  
  	//강의계획서 조회 페이지
	@GetMapping("/lecApply/inquiry")
	public String inquiry() {
		
		return "professor/lecApply/inquiry";
	}
	
	//강의계획서 신청 페이지
	@GetMapping("/lecApply/request")
	public String write() {
		
		return "professor/lecApply/request";
	}
	
	// 교수 개인정보
	@ResponseBody
	@PostMapping("/lecApply/proInfo")
	public Professor proInfo(HttpServletRequest request) {
		
		log.info("이쪽은 오나?");

		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("개인정보proNo : " + proNo);

		Professor professor = this.lectureApplyService.proInfo(proNo);
		log.info("교수개인professor : " + professor);

		return professor;
	}
	
	//년도 및 학기 불러오기
	@ResponseBody
	@PostMapping("/lecApply/getYrNSem")
	public List<LecApply> getYrNSem(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("년도/학기proNo : " + proNo);
		
		List<LecApply> list = this.lectureApplyService.getYrNSem(proNo);
		
		return list;
	}
	
	//제출한 강의계획서 리스트 불러오기
	@ResponseBody
	@PostMapping("/lecApply/list")
	public List<LecApply> list(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("리스트proNo : " + proNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proNo", proNo);
		
		List<LecApply> list = this.lectureApplyService.list(map);
		
		log.info("list : " + list);
		
		return list;
	}
	
	//제출한 강의계획서 개수 가져오기
	@ResponseBody
	@PostMapping("/lecApply/getCnt")
	public int getCnt(
			HttpServletRequest request,
			@RequestBody Map<String, Object> yrNsem) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("개수proNo", proNo);
		map.put("yrNsem", yrNsem.get("yrNsem"));
		
		log.info("getCnt map : " + map);
		
		int result = this.lectureApplyService.getCnt(map);
		
		log.info("getCnt result : " + result);
		
		return result;
	}
	
	//강의계획서 상세페이지 통합
	@GetMapping("/lecApplyForm/inquiryForm")
	public String inquiryForm(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("상세proNo : " + proNo);
		
		Professor professor = this.lectureApplyService.inquiryFormProInfo(proNo);
//		List<LecApply> lecApplyList = this.lectureApplyService.inquiryFormLecApInfo(proNo);
		
		model.addAttribute("professor", professor);
		
		log.info("상세professor : " + professor);
		
		return "professor/lecApplyForm/inquiryForm";
	}
	
	//강의계획서 상세페이지 강의정보
//	@ResponseBody
//	@PostMapping("/lecApplyForm/inquiryForm")
//	public List<LecApply> inquiryFormList(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int proNo = (int)session.getAttribute("no");
//		
//		log.info("리스트proNo : " + proNo);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("proNo", proNo);
//		
//		List<LecApply> list = this.lectureApplyService.list(map);
//		
//		log.info("list : " + list);
//		
//		return list;
//	}

}
