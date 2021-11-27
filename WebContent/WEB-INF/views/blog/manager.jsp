<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<title>Quản lí Blog</title>
</head>
<body>


	</script>
	<link href="<c:url value="/resources/bootstrap/css/styles.css" />"
		rel="stylesheet">

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/bootstrap/js/scripts.js" />"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
		crossorigin="anonymous"></script>

	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@include file="/WEB-INF/views/layout_side.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Quản lí Blog</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="blog/manager.htm?page=1">Blog</a></li>
						<li class="breadcrumb-item active">Quản lí</li>
					</ol>
					<div></div>


					<div>
						<div class="card">
							<div class="card-header d-flex">
								<a type="button" href="blog/create.htm" style='float: right; margin-right: 94px'
									class="btn btn-primary" data-toggle="modal"
									>Thêm</a>
							</div>
							<div class="card-body">
								<table class="dataTable-table">
									<tr>
										<th>Tiêu đề</th>
										<th class="text-center">Ngày</th>
										<th class="text-center">Views</th>
										<th class="text-center">Hành động</th>
									</tr>
									<c:forEach var="blog" items="${blogs.content }">
										<tr>
											<td>${blog.title}</td>
											<td class="text-center"><fmt:formatDate value="${blog.dateCreated}"
													pattern="dd/MM/yyyy" /></td>
											<td class="text-center">${blog.views}</td>
											<td class="text-center"><a href="blog/delete/${blog.tagBlog }.htm"><i
													class="fas fa-trash-alt" style="color: #26678c;"></i></a> &ensp; <a
												href="blog/update/${blog.tagBlog }.htm"><i
													class="far fa-edit" style="color: #26678c;"></i></a></td>
										</tr>
									</c:forEach>

								</table>
								<div style="margin-top: 5px">
									<nav aria-label="...">
										<ul class="pagination pagination-sm">
											<c:if test="${blogs.totalPages > 0}">
												<c:forEach var="pageNumber" items="${pageNumbers}">
													<li class="page-item"><a class="page-link"
														style="color: black; font-size: 16px"
														href="blog/manager.htm?page=${pageNumber}">${pageNumber}</a>
													</li>
												</c:forEach>
											</c:if>

										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>
		</div>
	</div>


</body>
</html>









