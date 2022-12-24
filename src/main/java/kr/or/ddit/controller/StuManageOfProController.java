package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.ManageService;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
public class StuManageOfProController {

	@Autowired
	StuManageOfProService stuManageOfProService;
	
	@Autowired
	ManageService manageService;
	
	@GetMapping("/professor/stuManageOfPro")
	public String stuManageOfpro(HttpSession session, Model model) {
		int depCd = (int)session.getAttribute("department");
		
		log.info("모가문젠데 controller " + depCd);
		
		List<Student> stuList = this.stuManageOfProService.stuList(depCd);
		
		model.addAttribute("list", stuList);
		
		return "professor/stuManage/stuManageOfPro";
	}
	
	@PostMapping("/professor/detailStu")
	@ResponseBody
	public Student detailStu(@RequestBody Map<String, String> map) {

		Student detailStu = this.manageService.detailStu(map);
		List<SclHistory> stuSclList = this.stuManageOfProService.stuSclList(map);
		
		detailStu.setStuSclList(stuSclList);
		
		log.info("detailStu 잘 넘어오나? " + detailStu);
		
		return detailStu;
	}
	
}
