package kr.or.ddit.filter;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
public class LogFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.info("log filter init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        log.info("log filter doFilter");
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        long time = System.currentTimeMillis();
        System.out.println("time = " + time);

        String userId = httpRequest.getRemoteUser();
        System.out.println("userId = " + userId);

        String requestURI = httpRequest.getRequestURI();
        System.out.println("requestURI = " + requestURI);

        String regex = "^/qna/(\\d+)$";
        // 정규표현식을 컴파일한다
        Pattern pattern = Pattern.compile(regex);
        System.out.println("pattern = " + pattern);

        // 입력 문자열에 정규표현식을 적용한다
        Matcher matcher = pattern.matcher(requestURI);
        System.out.println("matcher = " + matcher);

        // 정규표현식과 일치하는 문자열을 찾는다
        if (matcher.find()) {
            // 캡쳐한 그룹(group)을 추출한다
            String group = matcher.group(1);
        }
    }

    @Override
    public void destroy() {

        log.info("log filter destroy");
    }
}
