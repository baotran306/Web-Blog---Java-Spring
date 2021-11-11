<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Quản lý chỉ mục</title>
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>
	
	
	<div>
		<table class="table table-striped table-hover">
		    <thead class = "thead-primary">
			    <tr>
			        <th>ID</th>
			        <th>Tên chỉ mục</th>
			        <th>Tag</th>
			        <th>ID gốc</th>
			        <th></th>
			        <th></th>
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
		            <td><a href="category/update/${c.idCategory}.htm?linkUpdate">Sửa</a></td>
		            <td><a href="category/delete/${c.idCategory}.htm?linkDelete">Xóa</a></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>

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
	
	<c:if test="${message!=null }">
    <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>${message}</strong> 
    </div>
	</c:if>



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