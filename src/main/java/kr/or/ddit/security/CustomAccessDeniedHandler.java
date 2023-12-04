package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("요청 URI: {}", request.getRequestURI());
		log.info("예외 메세지: {}", accessDeniedException.getMessage());
		log.info("handle 로그인 권한 없음 !!!");
		if(request.authenticate(response)) {
			response.sendRedirect("/login/login");
		}else {
			response.sendRedirect("/security/accessError");
		}
	}
	
	
}
