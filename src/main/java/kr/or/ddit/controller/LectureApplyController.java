package kr.or.ddit.controller;

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
	
	// 교수 개인정보
//	@PostMapping("/proInfo")
//	public String proInfo(int proNo, Model model, HttpSession session) {
//		
//		log.info("proNo : " + proNo);
//		
//		//책 상세보기 데이터 가져온다
//		Professor professor = this.lectureApplyService.proInfo(proNo);
//		log.info("professor : " + professor);
//		
//		//공통 약속
//		model.addAttribute("bodyTitle", "교수 상세");
//		model.addAttribute("professor", professor);
//		
//		return "professor/proInfo";
//	}
	
	//제출한 강의계획서 리스트 불러오기
//	@ResponseBody
//	@PostMapping("/getList")
//	public List<LecApplyVO> getList(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
//		int memCd = 0;
//		
//		if(memberVO == null) {
//			memCd = 201100036;
//		}else {
//			memCd = memberVO.getMemCd();
//		}
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("memCd", memCd);
//		
//		List<LecApplyVO> list = this.lectureApplyService.list(map);
//		
//		return list;
//	}

}
