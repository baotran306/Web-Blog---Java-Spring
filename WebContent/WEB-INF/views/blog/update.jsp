<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<base href="${pageContext.servletContext.contextPath }/">

<html>
<head>
    <title>Create Blog</title>
    <style type="text/css">
.content{
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
.d-flex{
    background-color: #d3d5d7;
    height:auto;
    padding-top: 10px;
    padding-bottom: 10px;
    margin: 10px;
    border-radius: 5px;
}
</style>
</head>
<body>
<script type="text/javascript" src="<c:url value="/resources/ckfinder/ckfinder.js" />">
</script>
<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
<script type="text/javascript" src="/resources/ckfinder/ckfinder.js"></script >
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
	<div class="d-flex justify-content-center">
	    <div class="form-floating">
	    
	        <form modelAttribute="blog" action="blog/update.htm" method="post">
	        	<input hidden value="${blog.id }" name="id">	        		        	
	        	<div class="form-group">
	        		<label class="label">Tiêu đề</label>
	        		<input class="form-control"  name="title" placeholder="Tiêu đề" value="${blog.title }">
	        	</div>
	             
	            <div class="form-group">
	        		<label class="label">Chỉ mục</label>
	        		<select name="category.idCategory" class="form-control">
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
</div>
<script type="text/javascript">
    var editor = CKEDITOR.replace( 'editor' );
    CKFinder.setupCKEditor(editor, '${pageContext.request.contextPath}/resources/ckfinder/');
</script >
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