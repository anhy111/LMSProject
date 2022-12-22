package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
public class StuManageOfProController {

	@Autowired
	StuManageOfProService stuManageOfProService;
	
	@GetMapping("/professor/stuManageOfPro")
	public String stuManageOfpro(HttpSession session, Model model) {
		int depCd = (int)session.getAttribute("department");
		
		log.info("모가문젠데 controller " + depCd);
		
		List<Student> stuList = this.stuManageOfProService.stuList(depCd);
		
		model.addAttribute("list", stuList);
		
		return "professor/stuManage/stuManageOfPro";
	}
	
}
