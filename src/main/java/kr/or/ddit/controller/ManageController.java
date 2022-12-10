package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageController {
	
	@GetMapping("/manage/stuManage")
	public String stuManage(){
		
		return "manage/stuManage";
	}

}
