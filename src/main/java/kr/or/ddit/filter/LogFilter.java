package kr.or.ddit.filter;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.UUID;

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
        String requestURI = httpRequest.getRequestURI();
        log.info("log filter request = {} " + requestURI);

        String uuid = UUID.randomUUID().toString();
        log.info("log filter uuid = {} " + uuid);
        
        filterChain.doFilter(servletRequest, servletResponse);

    }

    @Override
    public void destroy() {
        log.info("log filter destroy");
    }
}
