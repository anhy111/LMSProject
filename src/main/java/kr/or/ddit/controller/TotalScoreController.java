package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Objection;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.TotalScoreService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/totalScore")
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class TotalScoreController {
	
	@Autowired
	TotalScoreService TSService;
	
	@GetMapping("totalScore")
	public String totalScoreGet(Principal principal,Model model,HashMap<String, Object> map) {
		String stuNo = principal.getName();
		int totalCnt = this.TSService.getTotalCrd(stuNo);
		HashMap<String, Object> nowMap = this.TSService.getNow();
		map.put("lecaYr",nowMap.get("YEAR"));
		map.put("lecaSem",nowMap.get("SEMESTER"));
		map.put("stuNo", stuNo);
		
		model.addAttribute("info", this.TSService.getTotalInfo(map));
		
		model.addAttribute("totalCnt", totalCnt);
		return "totalScore/totalScore";
	}
	
	@ResponseBody
	@PostMapping("getCnt")
	public int getCnt(Principal principal, @RequestBody Map<String, Object> dataObject) {
		log.info("성적 건수 세기...");
		String stuNo = principal.getName();
		HashMap<String, Object> nowMap = this.TSService.getNow();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("year",nowMap.get("YEAR"));
		map.put("semester",nowMap.get("SEMESTER"));
		map.put("stuNo", stuNo);
		map.put("lecaYr", dataObject.get("lecaYr"));
		map.put("lecaSem", dataObject.get("lecaSem"));
		
		int result = this.TSService.getCount(map);
		return result;
	}
	
	@ResponseBody
	@PostMapping("getPreCnt")
	public int getPreCnt(Principal principal) {
		log.info("현재학기 성적 건수 세기...");
		String stuNo = principal.getName();
		HashMap<String, Object> nowMap = this.TSService.getNow();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("year",nowMap.get("YEAR"));
		map.put("semester",nowMap.get("SEMESTER"));
		map.put("stuNo", stuNo);
		
		log.info(map.toString());
		int result = this.TSService.getPreCnt(map);
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
		log.info(map.toString());
		map.put("stuNo", stuNo);
		
		List<LecApply> lecApply = this.TSService.getYrAndSem(map);
		log.info(lecApply.toString());
		return lecApply;
		
	}
	
	@ResponseBody
	@PostMapping("getList")
	public List<LecApply> getListPost(Principal principal) {
		log.info("전체 성적 불러오기 ...");
		String stuNo = principal.getName();
		
		Map<String, Object> map = this.TSService.getNow();
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("stuNo", stuNo);
		insertMap.put("year", map.get("YEAR"));
		insertMap.put("semester", map.get("SEMESTER"));
		
		List<LecApply> list = this.TSService.getList(insertMap);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("getPreList")
	public List<LecApply> getPreList(Principal principal) {
		log.info("전체 성적 불러오기 ...");
		String stuNo = principal.getName();
		
		Map<String, Object> map = this.TSService.getNow();
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("stuNo", stuNo);
		insertMap.put("year", map.get("YEAR"));
		insertMap.put("semester", map.get("SEMESTER"));
		
		List<LecApply> list = this.TSService.getPreList(insertMap);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("getListAgain")
	public List<LecApply> getListAgainPost(Principal principal, @RequestBody Map<String, Object> dataObject) {
		log.info("선택한 년도/학기 성적 불러오기");
		String stuNo = principal.getName();
		
		log.info(dataObject.toString());
		Map<String, Object> map = this.TSService.getNow();
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("year", map.get("YEAR"));
		insertMap.put("semester", map.get("SEMESTER"));
		insertMap.put("stuNo", stuNo);
		insertMap.put("lecaYr", dataObject.get("lecaYr"));
		insertMap.put("lecaSem", dataObject.get("lecaSem"));
		
		List<LecApply> list = this.TSService.getListAgain(insertMap);
		
		return list;
	}

	
	//현재 학기 성적 조회
	@GetMapping("currentScore")
	public String pcurrentScoreGet(Principal principal, Model model) {
		String stuNo = principal.getName();
		HashMap<String, Object> map = this.TSService.getNow();
		model.addAttribute("now", map);
		log.info(map.toString());
		
		HashMap<String, Object> nowMap = this.TSService.getNow();
		map.put("lecaYr",nowMap.get("YEAR"));
		map.put("lecaSem",nowMap.get("SEMESTER"));
		map.put("stuNo", stuNo);
		
		model.addAttribute("info", this.TSService.getPreTotalInfo(map));
		
		
		return "totalScore/currentScore";
	}
	
	@GetMapping("preAppeal")
	public String preAppealGet(Principal principal, Model model) {
		HashMap<String, Object> map = this.TSService.getNow();
		model.addAttribute("now", map);
		log.info(map.toString() + "성적이의 신청 년도/학기");
		return "totalScore/preAppeal";
	}
	
	@ResponseBody
	@PostMapping("checkObjection")
	public int checkObjection(Principal principal,String lecaCd) {
		log.info("이의신청 여부 확인...");
		int result = 0;
		String stuNo = principal.getName();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecaCd", lecaCd);
		map.put("stuNo", stuNo);
		
		Objection obj = this.TSService.checkObjection(map);
		
		if(obj == null) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("getCourseInfo")
	public LecApply getCourseInfo(Principal principal,String lecaCd) {
		LecApply lecApply = this.TSService.getCourseInfo(lecaCd);
		return lecApply;
	}
	
	//이의신청 
	@PostMapping("sendAppeal")
	public String sendAppeal(Principal principal, Objection obj) {
		int stuNo = Integer.parseInt(principal.getName());
		obj.setStuNo(stuNo);
		log.info(obj.toString());
		this.TSService.preAppeal(obj);
		return "redirect:/totalScore/preAppeal";
	}
	
	//이의신청 페이지
	@GetMapping("preAppealManage") 
	public String preAppealManage() {
		return "totalScore/preAppealManage";
	}
	
	//이의신청 목록
	@ResponseBody
	@PostMapping("objectionList")
	public List<Objection> objectionList(Principal principal) {
		String proNo = principal.getName();
		
		List<Objection> obj =  this.TSService.objectionList(proNo);
		return obj;
	}
	
	//이의신청 상세
	@ResponseBody
	@PostMapping("objDetail")
	public Objection objDetail(Principal principal, String objCd) {
		Objection  obj=  this.TSService.objDetail(objCd);
		return obj;
	}
	@ResponseBody
	@PostMapping("updateY")
	public int updateY(Objection obj) {
		log.info(obj.toString());
		return this.TSService.updateY(obj);
	}
	@ResponseBody
	@PostMapping("updateN")
	public int updateN(Objection obj) {
		log.info(obj.toString());
		return this.TSService.updateN(obj);
	}
	

}
