package kr.or.ddit.filter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
public class LogFilter implements Filter {

//    private final LogCreateService logCreateService;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.info("log filter init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        long time = System.currentTimeMillis();
        /**
         *  저장할 때 시간 까지 넣어주면 됨 필요없음 이건, 필터의 경우엔 실시간 반영 가능하니까 충분히 조작 가능함. but 로거를 통해 로그를 저장하는 경우엔, 로그를 저장하는 폼이 필요하고, 그 폼을 주기적으로 (실시간 X) 업데이트를 실행해줘야 하며, 데이터가 가득 차면 비워줘야 함.
         */

        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        LogForm logData = new LogForm(httpRequest.getRemoteUser(), httpRequest.getRequestURI());
        String a = httpRequest.getRemoteUser();
        String b = httpRequest.getRequestURI();

        System.out.println("a = " + a);
        System.out.println("b = " + b);

//        logCreateService.logPush(logData);

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        log.info("log filter destroy");
    }
}
