<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý chỉ mục</title>
<style type="text/css">
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
	.col-md-4{
		width:200px;
		position: absolute;
		margin-left:350px;
		left: 0;
		right: 0;
	}
	.form-group{
		width: auto;
	}
	.form-control{
		width: 400px;
	}
	.form-update{
		width: 500px;
	}
	.btn-update{
		position: relative;
		left: 100px;
	}
</style>
</head>
<body>
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
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
	<div class="content">
		<div class="card" >
			<div class="card-header">Category</div>
				<div class="card-body">	
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
				        <div class="btn-update">
				            <button style='float:left; margin-left:100px' class="btn btn-primary">Cập nhật</button>
				        </div>
				    	</form>
				  	  </div>
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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>