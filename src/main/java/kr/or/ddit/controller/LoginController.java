package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	//스프링 시큐리티 접근 권한 
	//접근이 불가능한 페이지라면 접근 거부 처리가 되어 accessError.jsp를 forwarding함.
	@RequestMapping("/security/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
		return "security/accessError";
	}
	
	//기본 로그인 페이지가 아닌 사용자가 직접 정의한 로그인 페이지를 사용함
	//요청 URI : /security/login
	@RequestMapping("/login/login")
	public String loginForm(String error, String logout, Model model, Authentication auth) {
		// 시큐리티에서 DB에 없으면 error를 보내고 없으면 null을 보내냐 보댜 ㅇㅁㅇ
		log.info("error : " + error);
		log.info("logout : " + logout);
		//오류 메세지 
		if(error != null) {
			model.addAttribute("error", "Login Error!!!");
		}
		//로그아웃 메세지 
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
		
		if(auth != null) {
			return "test/home";
		}
		
		return "login/loginForm";
	}
	
	@GetMapping("/login/findID")
	public String findId() {
		return "login/findID";
	}
	
	@PostMapping("/login/searchId")
	@ResponseBody
	public ResponseEntity<String> searchId(HttpServletRequest request) {
		
		String memNm = request.getParameter("memNm");
		String memBir = request.getParameter("memBir");
		String memTel = request.getParameter("memTel");
		
		log.info("memNm : " + memNm);
		log.info("memBir : " + memBir);
		log.info("memTel : " + memTel);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("memNm", memNm);
		map.put("memBir", memBir);
		map.put("memTel", memTel);
		
		String searchId = memberService.searchId(map);
		
		ResponseEntity<String> entity = new ResponseEntity<String>(searchId, HttpStatus.OK);
		
		return entity;
		
	}
	
	@PostMapping("/login/searchPass")
	@ResponseBody
	public String searchPass(HttpServletRequest request, @RequestBody Map<String,String> map){
		
		log.info("map(최초) : " + map);
		log.info("tel(최초) : " + map.get("tel"));
		
		//메시지 발송 + 회원정보변경
		String temp = this.memberService.changePw(map);
		
		return map.get("tel");
		
	}
	
	@GetMapping("/sessionPlus")
	@ResponseBody
	public int sessionPlus(HttpSession session) {
		
		session.setMaxInactiveInterval(1805); // 세션 만료시간
		
		return 1;
	}
	
}
