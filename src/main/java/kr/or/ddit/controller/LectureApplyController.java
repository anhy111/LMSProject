package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/lecApplyInquiry")
	public String lecApplyInquiry() {
		
		return "professor/lecApplyInquiry";
	}
	
	//강의계획서 신청 페이지
	@GetMapping("/lecApplycation")
	public String lecApplycation() {
		
		return "professor/lecApplycation";
	}
	
	// 교수 개인정보
	@ResponseBody
	@PostMapping("/proInfo")
	public Professor proInfo(HttpServletRequest request) {
		
		log.info("이쪽은 오나?");

		HttpSession session = request.getSession();
		int proNo = (int)session.getAttribute("no");
		
		log.info("proNo : " + proNo);

		// 책 상세보기 데이터 가져온다
		Professor professor = this.lectureApplyService.proInfo(proNo);
		log.info("professor : " + professor);

		return professor;
	}
	
	//년도 및 학기 불러오기
	@ResponseBody
	@PostMapping("/getYrNSem")
	public List<LecApply> getYrNSem(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		LecApply lecApply = (LecApply)session.getAttribute("memSession");
		int proNo = 0;
		
		if(lecApply == null) {
			proNo = 201100036;
		}else {
			proNo = lecApply.getLecaCd();
		}
		
		List<LecApply> list = this.lectureApplyService.getYrNSem(proNo);
		
		return list;
	}
	

}
