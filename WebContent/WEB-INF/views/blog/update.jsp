<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<title>Cập nhật Blog</title>
</head>
<body>


	</script>
	<link href="<c:url value="/resources/bootstrap/css/styles.css" />"
		rel="stylesheet">
	<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/ckfinder/ckfinder.js" />">
		
	</script>
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
					<h1 class="mt-4">Cập nhật Blog</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="blog/manager.htm?page=1">Blog</a></li>
						<li class="breadcrumb-item active">cập nhật</li>
					</ol>
					<div>
					
					
						<form:form modelAttribute="blog" action="blog/update.htm" method="post">
							<div class="form-group">
							<form:hidden value="${blog.id }" path="id"></form:hidden>
								<label class="label">Tiêu đề</label> <form:input class="form-control"
									path="title" placeholder="Tiêu đề"></form:input>
									<div style="color: red;">
										<form:errors path="title"></form:errors>
									</div>
								
							</div>
							<br>
							<div class="form-group">
								<label class="label">Chỉ mục</label> <form:select path="category.idCategory"
									class="form-control">
									<c:forEach var="category" items="${categories}">
										<option value="${category.idCategory }">${category.nameCategory }</option>
									</c:forEach>
								</form:select>
							</div>
							<br>
							<label class="form-label">Nội dung </label>
							<form:textarea path="contentBlog" id="editor" rows="30"></form:textarea>
							<div style="color: red;">
							<form:errors path="contentBlog"></form:errors>
							</div>
							
							<br>
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary">Lưu</button>
							</div>



						</form:form>

					</div>

				</div>
			</main>
		</div>
	</div>

	<script type="text/javascript">
		var editor = CKEDITOR.replace('editor');
		CKFinder.setupCKEditor(editor,
				'${pageContext.request.contextPath}/resources/ckfinder/');
	</script>
</body>
</html>








































