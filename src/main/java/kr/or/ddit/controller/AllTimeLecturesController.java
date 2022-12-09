package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.AllTimeLectures;
import kr.or.ddit.domain.College;
import kr.or.ddit.service.AllTimeLecturesService;

@Controller
@RequestMapping("alltimelectures")
public class AllTimeLecturesController {
	@Autowired
	AllTimeLecturesService allTimeLecturesService;
	
	@GetMapping("/")
	public String Inquiry(Model model) {
		
		model.addAttribute("bodyTitle","역대강의조회");
		
		//forwarding
		return "alltimelectures/";
	}
	
	@PostMapping("/search")
//	@ModelAttribute AllTimeLectures alltimeLectures
	public static String search() {
		College college = new College();
		college.setColCd(1);
		college.setColNm("우송대");
		college.setColDes("우송대강당");
		college.setColTel("123-123");
		college.setColAddr("대전");
		college.setColImgUrl("우송대.jpg");
		System.out.println("단과대학정보: "  + college.toString());
		
		List<College> collegeList = new ArrayList<College>();
		collegeList.add(college);
		System.out.println("단과대학 리스트 : " + collegeList);
		
//		alltimeLectures.setCollegeList(collegeList);
		
		//forwarding
		return "redirect:/alltimelectures/";
	}
	public static void main(String[] args) {
		search();
	}
}
