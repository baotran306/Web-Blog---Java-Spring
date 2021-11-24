
    <%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath }/">
	<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
		<script src="<c:url value="/assets/fontawesome/js/all.min.js" />"></script>
		<script src="<c:url value="/assets/plugins/popper.min.js" />"></script>
		<script
			src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
	<style type="text/css">
body{
	background-color: #15191d;
}
header{
   display: block;
}
* { 
	 margin: 0;
	 padding: 0;
	 box-sizing: border-box;
}
.header1 {
  background-color: #f1f1f1;
  padding: 30px;
  text-align: center;
}
.main-wrapper {
    margin: 0;
    background: #fff;
    position: relative;
    border-radius: 5px;
}
.card-body{
    background-color: #d3d5d7;
}
.category{
	color:  #dce7f5
}
.category:hover {
	color: #ff944d;
	text-decoration: underline;
}
</style>
</head>
<body>
<header>
	<div class="header1">
	  <h2>Blog ThangBaoHien</h2>
	</div>
	<div id="navbar">
	  <a href="javascript:void(0)">Home</a>
	  <a class="active" href="category/home.htm">Category</a>
	  <a href="javascript:void(0)">Contact</a>
   	</div>
</header>
<div class="content">
	<p style="color: #fff;font-size: 14px">
		<a href="category/home.htm">
			<span class="category">Category<span>
		</a>
		<i class="fas fa-chevron-right"></i>
				
	</p>
<div class="main-wrapper">
		<div >
			<div class="card" >
			<div class="card-header">${blogs.get(0).getCategory().getNameCategory()}</div>
			<div class="card-body">	
				<div class="container single-col-max-width">
					<c:forEach items="${blogs }" var="blog">
						<div class="item mb-5">
							<div class="row g-3 g-xl-0">
								<div class="col-2 col-xl-3">
									<img class="img-fluid post-thumb "
										src="assets/images/blog/blog-post-thumb-2.jpg" alt="image">
								</div>
								<div class="col">
									<h3 class="title mb-1">
										<a class="text-link" href="blog/t/${blog.tagBlog}.htm?page=1">${blog.title }</a>
									</h3>
									<div class="meta mb-1">
										<span class="date">${blog.dateCreated}</span><span class="time">Lược
											xem: ${blog.views}</span><span class="comment"><p>
												Thảo luận: ${blog.comment.size()}</a></span>
									</div>
									<c:if test="${blog.contentBlog.length() > 475 }">
										<div class="intro">${blog.contentBlog.substring(0,475) }</div>
									</c:if>
									<c:if test="${blog.contentBlog.length() <= 475 }">
										<div class="intro">${blog.contentBlog }</div>
									</c:if>
									<a class="text-link" href="blog/t/${blog.tagBlog }.htm?page=1">Read
										more &rarr;</a>
								</div>
								<!--//col-->
							</div>
							<!--//row-->
						</div>
						<hr>
						<!--//item-->
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

	
</body>
</html>