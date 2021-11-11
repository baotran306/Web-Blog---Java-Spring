<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">

<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý chỉ mục</title>
</head>
<body>

	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	
      <div  class="col-md-4">
         <form:form action="category/update.htm" modelAttribute="category">
        <div>
            <label>ID</label>
            <form:input path="idCategory" readonly="true"/>
        </div>
        <div>
            <label>Tên chỉ mục</label>
            <form:input path="nameCategory" />
        </div>
        <div>
            <label>Id Gốc</label>
            <form:input path="idParent" />
        </div>
        <div>
            <button style='float:left; margin-left:100px' class="btn btn-primary">Cập nhật</button>
        </div>
    	</form:form>
  	  </div>

<script type="text/javascript">

</script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	
</body>
</html>