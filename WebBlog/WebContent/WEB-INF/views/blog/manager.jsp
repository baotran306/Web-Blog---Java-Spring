<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<base href="${pageContext.servletContext.contextPath }/">
<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
<script src="<c:url value="/assets/fontawesome/js/all.min.js" />"></script>
<script src="<c:url value="/assets/plugins/popper.min.js" />"></script>
<script src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Blog</title>
</head>
<body>
	<table class="table table-bordered">
  	<tr>
  		<th>Tiêu đề</th>
  		<th>Ngày</th>
  		<th>Views</th>
  		<th>Hành động</th>
  	</tr>
  	<c:forEach var="blog" items="${blogs }">
  	<tr>
  		<td>${blog.title}</td>
  		<td>${blog.dateCreated}</td>
  		<td>${blog.views}</td>
  		<td></td>
  		
  	</tr>
  	</c:forEach>
  	
	</table>
</body>
</html>