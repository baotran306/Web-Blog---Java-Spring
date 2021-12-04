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
		    background-color: #ebeced;
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
		.card{
			margin-bottom: 20px;
		}
		.title-category{
			color: white;
		}
		.title-category:hover{
			color:#ff944d;
		}
	</style>
</head>
<body>
	<header>					
	<div id="navbar">
	   <a class="active" href="category/home.htm"">Trang chủ</a>
	  <a  href="category/category-detail.htm">Danh mục</a>
   	</div>
	</header>
	<div class="content">
		<c:forEach var="category" items="${categories}" begin="0" end="4">
			<c:if test="${category.getBlog().size()!=0 }">
				<div class="card border-0" >
					<div class="card-header "style="color:white"><a class="title-category" href="blog/f/${category.tagCategory}.htm">${category.getNameCategory()}</a></div>
						<div class="card-body">
						<c:forEach var="blog" items="${category.getBlog() }" begin="0" end="4">
							<div class="form-menu-category">
								<div class="title">
									<i class="fas fa-comments" style="color: #ffba8c;"></i>
									<span><a href="blog/t/${blog.tagBlog }.htm?page=1" style="color:#23497c;font-size:20px;"><b>${blog.title}</b></a></span>
								</div>
								<div class="infor">
									<table style="width: 100%">
										<thead>
											<th style="margin-right: 5px;text-align: center;">Lượt xem</th>
											<th style="text-align: center;margin-right: 5px;">bình luận</th>
											<th style="text-align: center;">Thời gian đăng</th>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center;">
													${blog.views }
												</td>
												<td style="text-align: center;">${blog.getComment().size() }</td>
											    <td style="text-align: center;">${blog.dateCreated }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<hr>
						</c:forEach>
						</div>
				</div>
		</c:if>
		</c:forEach>				
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