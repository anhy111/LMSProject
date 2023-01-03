package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasAnyRole('ROLE_STUDENT', 'ROLE_MANAGER', 'ROLE_PROFESSOR')")
@Controller
public class MypageController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/mypage/mypage")
	public String mypage(int memNo, Model model) {
		
		log.info("memNo는?? " + memNo);
		
		Student student = this.memberService.readStudent(memNo);
		List<SclHistory> mySclList = this.memberService.mySclList(memNo);
		log.info("학생이 받은 장학 내역은 ? " + mySclList);
		
		model.addAttribute("student", student);
		model.addAttribute("mySclList", mySclList);
		model.addAttribute("bodyTitle", "마이페이지");
		
		return "mypage/mypage";
	}
	
	@PostMapping("/mypage/stuUpdate")
	public String stuUpdate(@ModelAttribute Student student) {
		
		log.info("student 정보 " + student.toString());
		
		int stuNo = student.getStuNo();
		
		this.memberService.stuUpdate(student);
		log.info("리다이렉트가 안되는겨??");
		
		return "redirect:/mypage/mypage?memNo="+stuNo;
	}
	
	@PostMapping("/mypage/changeStuPwPost")
	@ResponseBody
	public int changeStuPwPost(@RequestBody Map<String,String> map) {
		
		log.info("들어온 map - newPw : " + map.get("newPw") + " oldPw : " + map.get("oldPw") + " stuNo : " + map.get("stuNo"));
		
		int updateStuPw = this.memberService.updateStuPw(map);
		log.info("updateStuPw 잘 넘어 왔는가?! : " + updateStuPw);
		
		return updateStuPw;
	}
	
	
}
