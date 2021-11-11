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
	
	<table class="table">
    <tr>
        <th>ID</th>
        <th>Tên chỉ mục</th>
        <th>Tag</th>
        <th>ID gốc</th>
        <th></th>
    </tr>
    <c:forEach var="c" items="${categories}">
        <tr>
            <td>${c.idCategory}</td>
            <td>${c.nameCategory}</td>
            <td>${c.tagCategory}</td>
            <c:choose>
                <c:when test="${c.idParent != null}">
                    <td>c.idParent</td>
                </c:when>
                <c:otherwise>
                    <td></td>
                </c:otherwise>
            </c:choose>
            <td><a href="category/update/${c.idCategory}.htm?linkUpdate">Sửa</a></td>
            <td><a href="category/delete/${c.idCategory}.htm?linkDelete">Xóa</a></td>
        </tr>
    </c:forEach>
</table>

	
</body>
</html>