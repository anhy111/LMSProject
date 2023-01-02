package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.TotalScoreService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/totalScore")
public class TotalScoreController {
	
	@Autowired
	TotalScoreService TSService;
	
	@GetMapping("totalScore")
	public String totalScoreGet() {
		return "totalScore/totalScore";
	}
	
	@ResponseBody
	@PostMapping("getCnt")
	public int getCnt(Principal principal, String yrNsem) {
		log.info("성적 건수 세기...");
		String stuNo = principal.getName();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("stuNo", stuNo);
		map.put("yrNsem", yrNsem);
		int result = this.TSService.getCount(map);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("getInfo")
	public Student getInfoPost(Principal principal) {
		log.info("학생 개인정보 가져오기...");
		String stuNo = principal.getName();
		
		Student student = this.TSService.getInfo(stuNo);
		log.info(student.toString());
		return student;
	}
	
	@ResponseBody
	@GetMapping("getYrAndSem")
	public List<LecApply> getYrAndSemGet(Principal principal) {
		log.info("년도 및 학기 불러오기...");
		String stuNo = principal.getName();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = this.TSService.getNow();
		map.put("stuNo", stuNo);
		
		List<LecApply> lecApply = this.TSService.getYrAndSem(map);
		log.info(lecApply.toString());
		return lecApply;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("currentScore")
	public String pcurrentScoreGet() {
		return "totalScore/currentScore";
	}
	@GetMapping("preAppeal")
	public String preAppealGet() {
		return "totalScore/preAppeal";
	}
	
	
	
}
