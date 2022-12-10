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

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.ManageService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasRole('ROLE_MANAGER')")
@Controller
public class ManageController {
	
	@Autowired
	ManageService manageService;
	
	@GetMapping("/manage/stuManage")
	public String stuManage(Model model){
		
		List<Student> studentList = this.manageService.studentList();
		log.info("list 잘 들어오나 ?! " + studentList);
		
		model.addAttribute("list", studentList);
		
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

}
