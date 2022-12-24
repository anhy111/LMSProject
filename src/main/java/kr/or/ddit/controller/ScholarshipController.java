package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@GetMapping("/scholarshipList")
	public String scholarshipList() {
		
		return "scholarship/scholarshipList";
	}
	
	//장학금 목록 조회
	@ResponseBody
	@PostMapping("/scholarshipInquiry")
	public List<Scholarship> scholarshipInquiry() {
		List<Scholarship> scholarshipInquiry = this.scholarshipService.scholarshipInquiry();
		
		log.info("장학금 목록 : " + scholarshipInquiry);
		
		return scholarshipInquiry;
	}
	
	//장학금 수여 시작페이지
	@GetMapping("/scholarshipAward")
	public String scholarshipAward() {
		
		return "scholarship/scholarshipAward";
	}
	
	//장학금 수여 목록
	@ResponseBody
	@PostMapping("/scholarshipAwardList")
	public List<SclHistory> scholarshipAwardList() {
		List<SclHistory> scholarshipAwardList = this.scholarshipService.scholarshipAwardList();
		
		log.info("장학 수여 : " + scholarshipAwardList);
		
		return scholarshipAwardList;
	}
	
	//장학금 수여자 확인
	@ResponseBody
	@PostMapping("/scholarshipCheck")
	public int scholarshipCheck() {
		int result = this.scholarshipService.scholarshipCheck();
		
		log.info("장학금 수여자 확인 : " + result);
		
		return result;
	}
	
	//장학금 수여학생 정보
	@ResponseBody
	@PostMapping("/studentInfoList")
	public List<SclHistory> studentInfoList(@RequestBody int stuNo) {
		log.info("학번 넘어왔나용? : " + stuNo);
		
		List<SclHistory> studentInfoList = this.scholarshipService.studentInfoList(stuNo);
		
		log.info("수여학생 정보 불러오긔 : " + studentInfoList);
		
		return studentInfoList;
	}
	
	//장학금 수여
	@ResponseBody
	@PostMapping("/scholarshipConfer")
	public int scholarshipConfer(@RequestBody SclHistory sclHistory) {
		
		log.info("장학금 수여버튼 클릭 시 담긴 값 : " + sclHistory);
		
		int sclHistoryResult = this.scholarshipService.scholarshipConfer(sclHistory);
		
		if (sclHistoryResult < 0) {
			log.info("실패했슈 다시하쇼잉");
			return 0;
		}
		
		return sclHistoryResult;
		
	}
	
}
