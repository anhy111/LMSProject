package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;
import kr.or.ddit.security.Sha256;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.StuManageOfProService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasAnyRole('ROLE_STUDENT', 'ROLE_MANAGER', 'ROLE_PROFESSOR')")
@Controller
public class MypageController {
	
	@Autowired
	MemberService memberService;

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/mypage/mypage")
	public String mypage(Model model, HttpSession session) {
		
		return "mypage/pwConfirm";
	}
	@PostMapping("/mypage/mypagePost")
	public String mypagePost(Model model, HttpSession session, Member member, HttpServletRequest req) {
		
		int memNo = (int)session.getAttribute("no");
		String memPass = member.getMemPass();
		String memPassSha = Sha256.testSHA256(memPass);
		log.info("멤버정보 : " + member.getMemPass() + " 암호화 적용! : " + memPassSha);
		member.setMemPass(memPassSha);
		
		int inMypage = this.memberService.inMypage(member);
		log.info("inMypage : " + inMypage);
		
		if(inMypage == 1) {
			boolean userInRole = req.isUserInRole("ROLE_STUDENT");
			log.info("권한은??? " + userInRole);
			if(userInRole) {
				Student student = this.memberService.readStudent(memNo);
				model.addAttribute("student", student);
				model.addAttribute("bodyTitle", "마이페이지");
				
				return "mypage/mypage";
			}else {
				Employee employee = this.memberService.readEmployee(memNo);
				model.addAttribute("employee", employee);
				model.addAttribute("bodyTitle", "마이페이지");
				return "mypage/empMypage";
			}
			
		}else{
			return "redirect:/mypage/mypage";
		}
		
	}
	
	@PostMapping("/mypage/stuUpdate")
	public String stuUpdate(@ModelAttribute Student student) {
		
		log.info("student 정보 " + student.toString());
		
		int stuNo = student.getStuNo();
		
		this.memberService.stuUpdate(student);
		log.info("리다이렉트가 안되는겨??");
		
		return "redirect:/mypage/mypage";
	}
	
	@PostMapping("/mypage/empUpdate")
	public String empUpdate(@ModelAttribute Employee employee) {
		
		log.info("employee 정보 " + employee.toString());
		
		int empNo = employee.getEmpNo();
		
		this.memberService.empUpdate(employee);
		log.info("리다이렉트가 안되는겨??");
		
		return "redirect:/mypage/empMypage";
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
