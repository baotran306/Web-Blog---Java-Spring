<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
    <title>Create Blog</title>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/ckfinder/ckfinder.js" />">
</script>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
<script type="text/javascript" src="/resources/ckfinder/ckfinder.js"></script>
<div class="d-flex justify-content-center">
    <div class="form-floating">
        <form modelAttribute="blog" action="blog/create" method="post">
        	<div class="form-group">
        		<label class="label">Tiêu đề</label>
        		<input class="form-control"  name="title" placeholder="Tiêu đề">
        	</div>
             
            <div class="form-group">
        		<label class="label">Tiêu đề</label>
        		<select name="idCategory" class="form-control">
        		<c:forEach var="category" items="${categories}">
        		 	<option value="${category.idCategory }">${category.nameCategory }</option>
        		</c:forEach>
					 
				</select>
        	</div>
        	
            <label  class="form-label">Nội dung </label>
            <textarea path="contentBlog" id="editor"></textarea>
            <button type="submit"> Gửi </button>
        </form>
    </div>
</div>
<script type="text/javascript">
    var editor = CKEDITOR.replace( 'editor' );
    CKFinder.setupCKEditor(editor, '${pageContext.request.contextPath}/resources/ckfinder/');
</script >
</body>
</html>