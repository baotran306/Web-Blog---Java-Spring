<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<base href="${pageContext.servletContext.contextPath }/">


<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
<script src="<c:url value="/assets/fontawesome/js/all.min.js" />"></script>
<script src="<c:url value="/assets/plugins/popper.min.js" />"></script>
<script src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Blog</title>
</head>
<body>
	<div class="main-wrapper">
		<div >
			<div class="card" >
				<div class="card-header">Blog</div>
				<div class="card-body">
					<table class="table table-hover">
						<tr>
							<th>Tiêu đề</th>
							<th>Ngày</th>
							<th>Views</th>
							<th>Hành động</th>
						</tr>
						<c:forEach var="blog" items="${blogs }">
							<tr>
								<td>${blog.title}</td>
								<td><fmt:formatDate value="${blog.dateCreated}" pattern="dd/MM/yyyy" /></td>
								<td>${blog.views}</td>
								<td><a><i class="fas fa-trash-alt"
										style="color: #26678c;"></i></a> <a
									href="blog/update/${blog.tagBlog }.htm"><i
										class="far fa-edit" style="color: #26678c;"></i></a></td>


							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
	</div>


</body>
</html>