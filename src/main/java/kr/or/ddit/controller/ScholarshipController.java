package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;

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

import kr.or.ddit.domain.Scholarship;
import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.service.ScholarshipService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/scholarship")
public class ScholarshipController {

	@Autowired
	ScholarshipService scholarshipService;
	
	//장학금 목록 시작페이지
	@GetMapping("/admin/scholarshipList")
	public String scholarshipList() {
		
		return "scholarship/admin/scholarshipList";
	}
	
	//장학금 목록 조회
	@ResponseBody
	@PostMapping("/admin/scholarshipInquiry")
	public List<Scholarship> scholarshipInquiry() {
		List<Scholarship> scholarshipInquiry = this.scholarshipService.scholarshipInquiry();
		
		log.info("장학금 목록 : " + scholarshipInquiry);
		
		return scholarshipInquiry;
	}
	
	//장학금 수여 시작페이지
	@GetMapping("/admin/scholarshipAward")
	public String scholarshipAward(Model model) {
		
		model.addAttribute("bodyTitle", "장학금 수여");
		
		return "scholarship/scholarshipAward";
	}
	
	//장학금 수여 목록
	@ResponseBody
	@PostMapping("/admin/scholarshipAwardList")
	public List<SclHistory> scholarshipAwardList() {
		List<SclHistory> scholarshipAwardList = this.scholarshipService.scholarshipAwardList();
		
		log.info("장학 수여 : " + scholarshipAwardList);
		
		return scholarshipAwardList;
	}
	
	//장학금 수여자 확인
	@ResponseBody
	@PostMapping("/admin/scholarshipCheck")
	public int scholarshipCheck(@RequestBody int stuNo) {
		int result = this.scholarshipService.scholarshipCheck(stuNo);
		
		log.info("장학금 수여자 확인 : " + result);
		
		return result;
	}
	
	//장학금 수여학생 정보
	@ResponseBody
	@PostMapping("/admin/studentInfoList")
	public List<SclHistory> studentInfoList(@RequestBody int stuNo) {
		log.info("학번 넘어왔나용? : " + stuNo);
		
		List<SclHistory> studentInfoList = this.scholarshipService.studentInfoList(stuNo);
		
		log.info("수여학생 정보 불러오긔 : " + studentInfoList);
		
		return studentInfoList;
	}
	
	//장학금 수여
	@ResponseBody
	@PostMapping("/admin/scholarshipConfer")
	public int scholarshipConfer(@RequestBody SclHistory sclHistory) {
		
		log.info("장학금 수여버튼 클릭 시 담긴 값 : " + sclHistory);
		
		int sclHistoryResult = this.scholarshipService.scholarshipConfer(sclHistory);
		
		if (sclHistoryResult < 0) {
			log.info("실패했슈 다시하쇼잉");
			return 0;
		}
		
		return sclHistoryResult;
		
	}
	
	//학생 장학금 수혜내역 시작 페이지
	@GetMapping("/stu/stuScholarship")
	public String stuScholarship(Model model) {
		
		model.addAttribute("bodyTitle", "장학금 수혜 내역");
		
		return "scholarship/stu/stuScholarship";
	}
	
	//학생 장학금 수혜내역 목록
	@ResponseBody
	@PostMapping("/stu/stuScholarshipList")
	public List<SclHistory> stuScholarshipList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");
		
		List<SclHistory> stuScholarshipList = this.scholarshipService.stuScholarshipList(stuNo);
		
		log.info("장학 수혜내역 : " + stuScholarshipList);
		
		return stuScholarshipList;
	}
	
	// 학생 장학금 수혜 증명서 펼치기
	@GetMapping("/stuScholarshipForm/scholarshipBenefitCertificate")
	public String scholarshipBenefitCertificate(HttpServletRequest request, Model model, int sclhCd) {

		HashMap<String, Object> map = this.scholarshipService.scholarshipBenefitCertificate(sclhCd);
		map.put("sclhCd", sclhCd);

		model.addAttribute("map", map);

		return "scholarship/stuScholarshipForm/scholarshipBenefitCertificate";
	}
	
	@GetMapping("test")
	public String test() {
		
		return "scholarship/test";
	}
	
}
