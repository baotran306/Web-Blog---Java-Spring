<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<base href="${pageContext.servletContext.contextPath }/">


<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
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
</style>
</head>
<body>
<header>
	<div class="header1">
	  <h2>Blog ThangBaoHien</h2>
	</div>
	<div id="navbar">
	  <a class="active" href="javascript:void(0)">Home</a>
	  <a href="javascript:void(0)">News</a>
	  <a href="javascript:void(0)">Contact</a>
   </div>
</header>
<div class = "content">
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
						<c:forEach var="blog" items="${blogs.content }">
							<tr>
								<td>${blog.title}</td>
								<td><fmt:formatDate value="${blog.dateCreated}" pattern="dd/MM/yyyy" /></td>
								<td>${blog.views}</td>
								<td><a
									href="blog/delete/${blog.tagBlog }.htm"><i class="fas fa-trash-alt"									
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
	<div style="margin-top: 5px">			
			    <nav aria-label="..." >
	                <ul class="pagination pagination-sm">
	                    <c:if test="${blogs.totalPages > 0}">
	                    	<c:forEach var="pageNumber" items="${pageNumbers}">
	                    	<li class="page-item">
	                        <a class="page-link"
	                           style="color: black;font-size: 16px"
	                           href="blog/manager.htm?page=${pageNumber}">${pageNumber}</a>
	                   		 </li>                   	
	                    	</c:forEach>
	                    </c:if>
	                    
	                 </ul>
            	</nav>			
			</div>	
</div>
 <script>
	  window.onscroll = function() {myFunction()};

	  var navbar = document.getElementById("navbar");
	  var sticky = navbar.offsetTop;

	  function myFunction() {
	    if (window.pageYOffset >= sticky) {
	      navbar.classList.add("sticky")
	    } else {
	      navbar.classList.remove("sticky");
	    }
	  }
  </script>
</body>
</html>