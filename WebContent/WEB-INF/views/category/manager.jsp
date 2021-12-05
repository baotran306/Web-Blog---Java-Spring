<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<title>Quản lí danh mục</title>
<style type="text/css">

		.form-group #icon.fa-exclamation-circle{
			visibility: hidden;
		}
		.form-group small{
			visibility: hidden;
		}
		.form-group.error small{
			visibility: visible;
			position:absolute;
			color: red;
			left:40px;
			font-size: 16px
		}
		.form-group.error #icon.fa-exclamation-circle{
			visibility: visible;
			position:absolute;
			color: red;
			bottom:75px;
			font-size: 14px;
		}
		.form-group.error input{
			border-color: red;
		}
		.form-group.success #icon.fa-exclamation-circle{
			visibility: hidden;
		}
		.form-group.success small{
			isibility: hidden;
		}
</style>
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
		
		<c:if test="${result == 'true'}">
		<div id="SuccessMeg" class="alert alert-success" role="alert">
                ${message}
         </div>
		</c:if>
		<c:if test="${result == 'false'}">
		<div id="SuccessMeg" class="alert alert-danger" role="alert">
                ${message}
         </div>
		</c:if>
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Quản lí danh mục</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a
							href="category/manager.htm?page=1">Danh mục</a></li>
						<li class="breadcrumb-item active">Quản lí</li>
					</ol>
					<div></div>


					<div>
						<div class="card">
							<div class="card-header">
							<div class="d-flex">
							<button type="button" style='float: right; margin-right: 94px'
									class="btn btn-primary" data-toggle="modal"
									data-target="#exampleModal" data-whatever="@mdo">Thêm</button>
							</div>
								
							</div>
							<div class="card-body">


								<table class="dataTable-table">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên chỉ mục</th>
											<th>Tag</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${categories}">
											<tr>
												<td>${c.idCategory}</td>
												<td>${c.nameCategory}</td>
												<td>${c.tagCategory}</td>

												<td class="text-center"><a
													href="category/delete/${c.idCategory}.htm?linkDelete"><i
														class="fas fa-trash-alt" style="color: #26678c;"></i></a>
													&ensp; <a
													href="category/update/${c.idCategory}.htm?linkUpdate"><i
														class="far fa-edit" style="color: #26678c;"></i></a>
											</tr>
										</c:forEach>
									</tbody>
								</table>


								<hr>

								<div class="modal fade" id="exampleModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="insertCategory">Thêm danh
													mục</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="category/insert.htm" modelAttribute="category"
													method="post">
													<div class="form-group">
														<label for="nameCategory" class="col-form-label">Tên
															danh mục:</label> <input type="text" class="form-control"
															id="nameCategory" name='nameCategory' />
															<i id="icon"  class="fas fa-exclamation-circle"></i>
                        									<small>Error message</small>
													</div>
													<br>
													<input type="text" class="form-control" id="idParent"
														name='idParent' hidden="true" />
													<div class='d-flex' style='justify-content: end'>
														<button type="button" class="btn btn-secondary mr-4"
															data-dismiss="modal">Close</button> &nbsp
														<button class="btn btn-primary" id="submit">Lưu</button>
													</div>
												</form>
											</div>
										</div>
									</div>



								</div>
							</div>
						</div>

					</div>
			</main>
		</div>
	</div>
	<script type="text/javascript">
	function checkInput(){
    	var check=true;
		  var nameCategory = document.getElementById("nameCategory");
			if(nameCategory.value===""){
				setErrorFor(nameCategory, "Vui lòng nhập tên danh mục!");
				check=false;
			}else{
				setSuccesFor(nameCategory);
			}
			return check;
	  }
	  
	  function setErrorFor(input, message) {
		    const formControl = input.parentElement;

		    const small = formControl.querySelector('small');

		    small.innerText = message;
		    formControl.className = 'form-group error';
		}

		function setSuccesFor(input) {
		    const formControl = input.parentElement;
		    formControl.className = 'form-group success';
		}
		submit.addEventListener("click",function(event){
			if (checkInput() === true) {
				
	        } else {
	        	event.preventDefault();
	        }
		});
	
	</script>
	    <script>
        setTimeout(function () {
            $("#SuccessMeg").fadeOut('slow');
        }, 2000);
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









