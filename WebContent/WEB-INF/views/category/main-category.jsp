<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <base href="${pageContext.servletContext.contextPath }/">
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
		.form-menu-category{
			 display: grid;
			 height:auto;				
			 width:100%;
			 grid-template-columns: 0.7fr 0.3fr;
			 grid-template-rows: 1fr;
			 grid-template-areas:"title infor";
		}
		.title{
			grid-area:title;
		}
		.infor{
			grid-area:infor;
		}
		.card-header{
			background-color: #5c7099;
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
	  <a class="active" href="category/home.htm">Danh mục</a>
   	</div>
	</header>
	<div class="content">
		<div class="card" >
			<div class="card-header "style="color:white">Danh mục</div>
				<div class="card-body">
				<c:forEach var="category" items="${categories }">
					<div class="form-menu-category">
						<div class="title">
							<i class="fas fa-comments"></i>
							<span><a href="blog/f/${category.tagCategory}.htm"><b>${category.nameCategory }</b></a></span>
						</div>
						<div class="infor">
							<table style="width: 100%">
								<thead>
									<th style="margin-right: 5px;text-align: center;">views</th>
									<th style="text-align: center;">Threads</th>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center;">
											<c:set var="views" value="${0 }"/>
											<c:forEach var="blog" items="${category.getBlog() }">
												<c:set var="views" value="${views+blog.getViews() }" />
											</c:forEach>
											${views}
										</td>
										<td style="text-align: center;">${category.getBlog().size() }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<hr>
				</c:forEach>
				</div>
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