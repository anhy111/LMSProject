<%@ page import="com.amazonaws.services.s3.AmazonS3" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>

<%
  WebApplicationContext context =
          (WebApplicationContext) request.getServletContext()
                  .getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
  AmazonS3 s3Client = (AmazonS3) context.getBean("s3client");
%>

