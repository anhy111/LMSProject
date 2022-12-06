package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Counsel;
import kr.or.ddit.service.CounselService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/counsel")
public class CounselController {
	@Autowired
	CounselService counselService;
	
	@GetMapping("/main")
	public String CounselList(Model model) {
		List<Counsel> counselList = this.counselService.CounselList();
		
		//공통 약속
		model.addAttribute("bodyTitle","상담");
		model.addAttribute("counselList", counselList);
		
		//forwarding
		return "counsel/main";
	}
}
