package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.CommonDetail;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.CollegeService;
import kr.or.ddit.service.CommonDetailService;
import kr.or.ddit.service.ManageService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasRole('ROLE_MANAGER')")
@Controller
public class ManageController {
	
	@Autowired
	ManageService manageService;
	@Autowired
	CommonDetailService commonDetailService;
	@Autowired
	CollegeService collegeService;
	
	@GetMapping("/manage/stuManage")
	public String stuManage(Model model){
		
		List<Student> studentList = this.manageService.studentList();
		List<CommonDetail> commonDetailList = this.commonDetailService.commonDetailList("BANK");
		log.info("list 잘 들어오나 ?! " + studentList);
		List<College> collegeList = this.collegeService.CollegeList();
		
		model.addAttribute("list", studentList);
		model.addAttribute("commonDetailList",commonDetailList);
		model.addAttribute("collegeList",collegeList);
		
		return "manage/stuManage";
	}
	
	@PostMapping("/manage/detailStu")
	@ResponseBody
	public Student detailStu(@RequestBody Map<String,String> map) {
		
		log.info("detailStu는?? " + map.get("detailStu"));
		
		Student detailStu = this.manageService.detailStu(map);
		
		log.info("다시온 detailStu!! " + detailStu);
		
		return detailStu;		
	}
	
	@PostMapping("/manage/deleteStu")
	@ResponseBody
	public int delete(@RequestBody Map<String,String> map) {
		
		log.info("delete의 stuNo는?? " + map.get("stuNo"));
		
		int deleteStu = this.manageService.deleteStu(map);
		
		log.info("삭제되었을 거라고 믿어의심치 않는다 . " + deleteStu);
		
		return deleteStu;
	}

}
