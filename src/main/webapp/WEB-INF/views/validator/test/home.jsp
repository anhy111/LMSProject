<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <title>Home</title>
</head>
<body>
<h1>
  Sign up
</h1>
<form action="/check">
  ID : <input type="text" name="id"><br>
  PW : <input type="password" name="pw"><br>
  <input type="submit">
</form>
</body>
</html>