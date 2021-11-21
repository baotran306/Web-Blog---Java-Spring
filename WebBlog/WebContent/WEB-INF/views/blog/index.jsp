<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
<script src="<c:url value="/resources/ckfinder/ckfinder.js" />"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<form action="getContent" method="get">
    <textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>
    <input type="submit" value="Submit" />
</form>
<script>

    var editor = CKEDITOR.replace('editor1');
    CKFinder.setupCKEditor(editor, '${pageContext.request.contextPath}/resources/ckfinder/');
</script>
</body>
</html>