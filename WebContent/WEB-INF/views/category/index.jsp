<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Quản lý chỉ mục</title>
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
<div class="content">
	<c:if test="${message!=null }">
		<c:choose>
			<c:when test = "${message=='thanhcong'}">
				<div class="alert alert-success alert-dismissible fade show">
		        <button type="button" class="close" data-dismiss="alert">&times;</button>
		        <strong>Thành công</strong> 
		    	</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger alert-dismissible fade show">
		        <button type="button" class="close" data-dismiss="alert">&times;</button>
		        <strong>Thất bại</strong> 
		    	</div>
			</c:otherwise>
		</c:choose>
    
	</c:if>
<div class="main-wrapper">
		<div >
			<div class="card" >
				<div class="card-header">Category</div>
				<div class="card-body">	
	<div>
		<table class="table table-hover">
		    <thead>
			    <tr>
			        <th>ID</th>
			        <th>Tên chỉ mục</th>
			        <th>Tag</th>
			        <th>ID gốc</th>
			        <th>Action</th>
			    </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="c" items="${categories}">
		        <tr>
		            <td>${c.idCategory}</td>
		            <td>${c.nameCategory}</td>
		            <td>${c.tagCategory}</td>
		            <c:choose>
		                <c:when test="${c.idParent != null}">
		                    <td>${c.idParent}</td>
		                </c:when>
		                <c:otherwise>
		                    <td></td>
		                </c:otherwise>
		            </c:choose>
		            <td><a href="category/update/${c.idCategory}.htm?linkUpdate">Sửa</a>
		            |<a href="category/delete/${c.idCategory}.htm?linkDelete"> Xóa</a></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>
		<hr>
		<button type="button" style='float:right; margin-right:94px' class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Thêm</button>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="insertCategory">Thêm chỉ mục mới</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
	    			 </button>
	      </div>
		      <div class="modal-body">
		        <form action = "category/insert.htm" modelAttribute = "category" method="post" >
		          <div class="form-group">
		            <label for="nameCategory" class="col-form-label">Tên chỉ mục:</label>
		            <input type="text" class="form-control" id="nameCategory" name='nameCategory'/>
		          </div>
		          <div class="form-group">
		            <label for="idParent" class="col-form-label">Id gốc:</label>
		            <input type="text" class="form-control" id="idParent" name='idParent'/>
		          </div>
	       		<div class='d-flex' style='justify-content: end'>
			        <button type="button" class="btn btn-secondary mr-4" data-dismiss="modal">Close</button>
			        <button class="btn btn-primary">Lưu</button>
	       		</div>
			      </form>
		    	</div>
	  				</div>
				</div>
			</div>
	</div>
	</div>
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

<script type="text/javascript">
	setTimeout(()=>$(".alert").hide(),2000)
</script>

	
</body>
</html>