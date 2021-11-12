<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">

<html>
<head>
    <title>Create Blog</title>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/ckfinder/ckfinder.js" />">
</script>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
<script type="text/javascript" src="/resources/ckfinder/ckfinder.js"></script >
<div class="d-flex justify-content-center">
    <div class="form-floating">
    
        <form modelAttribute="blog" action="blog/update.htm" method="post">
        	<input hidden value="${blog.id }">
        	<input hidden value="${blog.id }">
        	
        	
        	<div class="form-group">
        		<label class="label">Tiêu đề</label>
        		<input class="form-control"  name="title" placeholder="Tiêu đề" value="${blog.title }">
        	</div>
             
            <div class="form-group">
        		<label class="label">Chỉ mục</label>
        		<select name="idCategory" class="form-control">
        		<c:forEach var="category" items="${categories }">      			
        			<c:choose>
        				 <c:when test="${blog.category.idCategory == category.idCategory }">
        					<option value="${category.idCategory }" selected="selected">${category.nameCategory }</option>
        				</c:when>
        				 <c:when test="${blog.category.idCategory != category.idCategory }">
        					<option value="${category.idCategory }">${category.nameCategory }</option>
        				</c:when>
        			</c:choose>
        		 	
        		</c:forEach>				 
				</select>
        	</div>
        	
            <label  class="form-label">Nội dung </label>
            <textarea name="contentBlog" id="editor">${blog.contentBlog }</textarea>
            <br>
            <div class="d-flex justify-content-center">
            	<button type="submit" class="btn btn-primary"> Lưu </button>
            </div>
            
            
            
        </form>
        <div>${message}</div>
    </div>
</div>
<script type="text/javascript">
    var editor = CKEDITOR.replace( 'editor' );
    CKFinder.setupCKEditor(editor, '${pageContext.request.contextPath}/resources/ckfinder/');
</script >

</html>