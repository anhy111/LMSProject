package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.MemberMapper;
import lombok.extern.slf4j.Slf4j;

/* 	/notice/register >> loginForm >> 로그인 >> CustomLoginSuccessHandler(성공!)
 * 	>> 사용자 작업 >> /notice/register 로 리다이렉트 해줌(스프링 시큐리티에서 기본적으로 사용되는 구현 클래스)
 * 
 */

@Slf4j
public class CustomLoginSuccessHandler extends 
	SavedRequestAwareAuthenticationSuccessHandler {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws ServletException, IOException {
		log.warn("onAuthenticationSuccess에 옴 로그인 성공 !!!!");

		// Authentication(인증) -> 로그인
		CustomUser customUser = (CustomUser) auth.getPrincipal();

		// 로그인 아이디
		log.info("username : " + customUser.getUsername());
		Member member = customUser.getMemberVO();
		
		
		Member read = memberMapper.read(member.getMemNo());
		Employee readEmployee = memberMapper.readEmployee(member.getMemNo());
		Student readStudent = memberMapper.readStudent(member.getMemNo());
		Professor readProfessor = memberMapper.readProfessor(member.getMemNo());
		Manager readManager = memberMapper.readManager(member.getMemNo());
		

		log.info("이렇게하면 들어올까욤? " + readEmployee);
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800); // 세션 만료시간
		
		session.setAttribute("no", read.getMemNo());
		String no = String.valueOf(session.getAttribute("no"));
		log.info("no는?? " + no);
		
		RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

		if (readEmployee != null) {
			session.setAttribute("name", readEmployee.getEmpNm());
			session.setAttribute("pic", readEmployee.getEmpPic());
			if (readProfessor != null) {
				redirectStrategy.sendRedirect(request, response, "/lecture/myLecture");
				session.setAttribute("position", readProfessor.getProPos());
				session.setAttribute("department", readProfessor.getDepCd());
				session.setAttribute("depCd", readProfessor.getDepCd());

			} else {
				redirectStrategy.sendRedirect(request, response, "/aschedule/calendar");
				session.setAttribute("position", readManager.getEmpPos());
				session.setAttribute("division", readManager.getEmpDiv());
			}
		} else {
			session.setAttribute("name", readStudent.getStuNm());
			String name = String.valueOf(session.getAttribute("name"));
			session.setAttribute("department", readStudent.getDepNm());
			log.info("name은??" + name);
			session.setAttribute("pic", readStudent.getStuPic());
		}
		
		super.onAuthenticationSuccess(request, response, auth);
	}

}
