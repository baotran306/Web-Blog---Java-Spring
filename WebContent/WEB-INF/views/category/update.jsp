

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<title>Quản lí danh mục</title>
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
					<h1 class="mt-4">Quản lí danh mục</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a
							href="category/manager.htm?page=1">Danh mục</a></li>
						<li class="breadcrumb-item active">Cập nhật</li>
					</ol>
				
					<div class="content">
		<div class="card-body d-flex justify-content-center">	
				      <div  class="col-md-4">
				      <form class="form-update" action="category/update.htm" modelAttribute="category" method="post">
				        <div hidden>
				            <label>ID</label>
				            <input class="form-control"  name="idCategory" placeholder="Tên chỉ mục" value="${category.idCategory}">
				        </div>
				       <div class="form-group">
					        <label class="label">Tên chỉ mục</label>
					        <input class="form-control"  name="nameCategory" placeholder="Tên chỉ mục" value="${category.nameCategory}">
					   </div>
					   <br>
				        <div class="btn-update">
				            <button style='float:left; margin-left:100px' class="btn btn-primary">Cập nhật</button>
				        </div>
				    	</form>
				  	  </div>
	  	        </div>

					</div>
			</main>
		</div>
	</div>

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	setTimeout(()=>$(".alert").hide(),2000)
</script>
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	setTimeout(()=>$(".alert").hide(),2000)
</script>

</body>
</html>









