<%@page import="org.springframework.data.domain.Page"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.web.entity.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <base href="${pageContext.servletContext.contextPath}/">
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/menu-bar-style.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
	<style>
		body{
			background-color: #343a40;
		}
			* { 
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}
		.container{
			 display: grid;
			 min-height: 100vh;			
			 width:100%;
			 grid-template-columns: 1fr;
			 grid-template-rows: 1.6fr 0.4fr;
			 grid-template-areas:"container-body" "container-comment";
		}
		.container-body{
			grid-area:container-body;	
			margin-bottom: 15px;
			margin-top: 10px;
			border-radius:5px;
		}
		.container-comment{
			grid-area:container-comment;
			width: 100%;
			height:auto;
			border-radius:5px;
		}
		.box-user{
			background-color:#e2e3e5;
			grid-area:box-user;
			border-right: 1px solid #c3c6c9;
			text-align: center;
			border-radius:5px 0px 0px 5px;
			width:100%;
			height:auto;
			color:#ff944d;
			font-size: 16px;
		}
		.box-comment{
			margin-top:5px;
			grid-area:box-comment;
			box-sizing: 1px solid white;
			border-radius:5px;
			margin:5px;
			text-align: justify;
			width:auto;
			height:auto;
			overflow: auto;
			padding-top: 20px;
		}
		.box-comment p{
			padding: 5px;
			font-family:Times New Roman,Times,serif;
			font-size:16px;
				
		}
		.container-replay{
			position: relative;
			bottom:0px;
			width: auto;
			height:30px;
			grid-area:container-replay;
		}
		.container-replay a{
			position: absolute;
			color:blue;
			right: 10px;
			width:auto;
			bottom:10px;
			font-size: 16px;
			font-weight: normal;
		}
		.container-replay a span{
		 	color:#23497c;
		 	font-size: 1.5rem;
		}
		.container-replay a span:hover{
			cursor:pointer;
		 	color:red;
		 	text-decoration: underline;
		}
		.container-replay a i{
		 	color:blue;
		}
		.comment-size{
			display: grid;
			width:100%;
			height:auto;
			grid-template-columns: 1fr;
			grid-template-rows: 0.1fr 0.2fr 0.1fr;
			grid-template-areas: "name-comment" "text-area" "button-submit";
			background-color: white;
			position: relative;
		}
		.name-comment{
			grid-area:name-comment;
			position:relative;
			height: 40px;
			left:10px;
			top:10px
		}
		.text-area{
			position:relative;
			grid-area:text-area;
			width: auto;
			height: auto;
		}
		.button-submit{
			grid-area:button-submit;
			position: absolute;
			width:auto;
			top: -5px;
			height: auto;
			right: 10px;
		}
		 ::before,
         ::after {
            margin: 0;
            padding: 0;
            box-sizing: inherit;
        }
        
        html {
            font-family: 'Roboto', sans-serif;
            font-size: 10px;
            box-sizing: border-box;
        }
        
        .container-collapse {
            width: 100%;
            height:auto;
/*             max-width: 80rem;
 */            margin: 0 auto;
            padding: 0 0.5rem;
            position: relative;
        }
        
        .accordion {
            color: #15191d;
            border-top-color: #cbcdd0;
            border-right-color: #c3c6c9;
            border-bottom-color: #b5b9bd;
            border-left-color: #c3c6c9;
            border-radius: 4 px;
            padding: 5px;
        }
        
        blockquote {
            display: block;
            width:100%;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 40px;
            margin-inline-end: 40px;  
            position: relative;    
            margin: 0.5rem 0;
            background: #e2e3e5;
            border: 1px solid #d3d5d7;
            border-left: 4px solid #ff944d;
            grid-area:bbCodeBlock;
            overflow: hidden;
            -webkit-transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;
            transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;    
        }
       
        
        .bbCodeBlock-expandLink {
            display: none;
            position: absolute;
            top: 38px;
            left: 0;
            right: 0;
            height: 75px;
            cursor: pointer;
            z-index: 0;
            background: transparent;
            background: linear-gradient(to bottom, rgba(226, 227, 229, 0) 0%, #e2e3e5 80%);
        }
        
        .bbCodeBlock-expandLink em {
            position: absolute;
            bottom: 8px;
            left: 0px;
            right: 0;
            text-align: center;
            font-size: 1.5rem;
            color: #ff944d;
            text-decoration: none;
            tabindex:0;
        }
        
        .accordion {
            height: auto;
            overflow: hidden;
            position: relative;
            font-size: 1.4rem;
        }
        .accordion img{
        	width: 50%;
        	position: relative;
        }
        .card-comment{
        	margin-top:10px;
        	width:100%;
        	height:auto;
        	background-color: #ebeced;
        	display:grid;
        	border-radius:5px;
			grid-template-columns: 0.2fr 0.8fr;
			grid-template-rows: 1fr;
			grid-template-areas: "box-user box-comment";
        }
        header{
        	display: block;
        }
        .title{
        	margin-bottom: 20px;
        } 
        .user-style{
        	margin-top: 25px;
        	color: #23497c;
        	font-size: 24px;
        	font-weight: bold;
        }
        .category{
			color:  #dce7f5
		}
		.category:hover {
			color: #ff944d;
			text-decoration: underline;
		}
		.name-comment i.fa-exclamation-circle{
			visibility: hidden;
		}
		.name-comment small{
			visibility: hidden;
		}
		.name-comment.error small{
			visibility: visible;
			position:absolute;
			left:705px;
			top:0px;
			color: red;
			font-size: 16px
		}
		.name-comment.error i.fa-exclamation-circle{
			visibility: visible;
			position:absolute;
			left:680px;
			top:5px;
			color: red;
			font-size: 14px;
		}
		.name-comment.error input{
			border-color: red;
		}
		.name-comment.success i.fa-exclamation-circle{
			visibility: hidden;
		}
		.name-comment.success small{
			isibility: hidden;
		}
		.header1 {
		  background-color: #f1f1f1;
		  padding: 30px;
		  text-align: center;
		}
		.bbCodeBlock-title {
		    padding: 6px 10px;
		    font-size: 0.875rem;
		    color: #ff944d;
		    background: #e7e8e9;
		}
	</style>
</head>
<body>
<header>

	<div id="navbar">
	  <a href="category/home.htm"">Trang chủ</a>
	  <a class="active" href="category/category-detail.htm">Danh mục</a>
   	</div>
</header>	
	<div class="content">		
			<header class="title">
				<p style="color: #fff;font-size: 14px">
					<a href="category/category-detail.htm">
						<span class="category">Danh mục</span>
					</a>
					<i class="fas fa-chevron-right"></i>
					<a href="blog/f/${blog.getCategory().getTagCategory()  }.htm">
						<span class="category">${blog.getCategory().getNameCategory() }</span>
					</a>
					<i class="fas fa-chevron-right"></i>
				</p>
				<h2 style="color: white;">${blog.getTitle() }</h2>
				<p  style="color: #8f9193;font-size: 14px;margin-top:5px"><i class="fas fa-clock"></i><span> ${blog.getDateCreated() }</span></p>
			</header>					
 		<div class="container-body" >
 			<div class="card-comment">
 				<div class="box-user">
 					<p id="name-comment0" class="user-style">admin</p>
 				</div>
 				<div class="box-comment" id="box-comment0">
 					<div id="value-comment0">
 							${blog.getContentBlog() }
 					</div>
 					<hr>
 					<div class="container-replay">
 						<a class="replay" onclick="myfunction('value-comment0','name-comment0',0)">
 							<span class="fas fa-reply"> Reply</span>
 						</a>
 					</div>
 				</div>
 			 </div>
	        <div style="margin-top: 20px">			
	             <p><h2><span style="color: #dce7f5;">Comment</span></h2></p>			
				</div>		
						<% 
						Page<Comment> std = (Page<Comment>)request.getAttribute("comments");
						if(std!=null){
       					 for(Comment c:std.getContent()){
       						out.write("<div class=\"card-comment\">"
       					 				+"<div class=\"box-user\">"
       									+"<p class=\"user-style\" id=\"name-comment"+c.getIdComment()+"\">"+c.getNameComment()+"</p>"
			       					 	+"</div>"
       									+"<div class =\"box-comment\" id=\"box-comment\">"
			       						+c.getContentComment()			       				
			       						+"<hr>"
			       						+"<div class=\"container-replay\">"
			       						+"<a class=\"replay\" onclick=\"myfunction('value-comment"+c.getIdComment()+"','name-comment"+c.getIdComment()+"',"+c.getIdComment()+")\">"
			       						+"<span class=\"fas fa-reply\"> Reply</span>"
				       					+"</a></div></div></div>"); 
	       					 };
       					 }%>
       		<div style="margin-top: 5px">			
			 <nav aria-label="..." >
                <ul class="pagination pagination-sm">
                    <c:if test="${pageComment.totalPages > 0}">
                    	<c:forEach var="pageNumber" items="${pageNumbers}">
                    	<li class="page-item">
                        <a class="page-link"
                           style="color: black;font-size: 16px"
                           href="blog/t/${blog.getTagBlog()}.htm?page=${pageNumber}">${pageNumber}</a>
                   		 </li>                   	
                    	</c:forEach>
                    </c:if>
                    
                 </ul>
            	</nav>			
			</div>																			
		</div>
		<div class ="container-comment">
			<form id="form-Comment-post" action="blog/t/${blog.getTagBlog() }.htm" method="post" modelAttribute="comment">
				<div class="comment-size">
					<div hidden>
						<input type="text" name="blog.id" value="${blog.getId() }">
					</div>
					<div class="name-comment">
						<input style="width: 700px" type="text" class="form-control" id="namComment" name="nameComment" placeholder="Name comment">
						<i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
					</div>
					<div class="text-area" id="comment-content">
						<textarea rows="10" cols="20" name = "contentComment" id="editor">
							<div id = "value-comment${idComment+1 }">
								<p></p>
							</div>
						</textarea>	
					</div>
					<div class="button-submit">
						<button class="btn btn-primary" id="submit" type="submit">
							<i class="fas fa-reply"></i>
							<span>Post Replay</span>
						</button>
					</div>			
				</div>	
			</form>
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

	<script type="text/javascript">
	 	 var editor = CKEDITOR.replace( 'editor');
		 var submit = document.getElementById("submit");
	 	 CKEDITOR.config.removePlugins = 'magicline';
	 	 var data = new Array();
	 	 <%
	 	 	if(std!=null){
	 	 	for(int i=0;i<std.getContent().size();i++){
	 	 %>
	 	 data[<%= i %>] = <%=std.getContent().get(i).getIdComment() %>;
	 	<%}}else{
	 	%>
	 		data[0]="${idComment}";
	 	<%}%>
	     
			window.onclick = e =>{
				console.log(e.target);
				if(e.target.id.substring(0,8)==='js-click')
				showExpand(e.target.id.substring(8,10));
			}
	        function disExpand() {
	        	for (var i = 0; i < data.length; i++) {
	        		const classAccordion = document.getElementById("accordion"+data[i]);
	        		if(classAccordion!=null){
		        		const expande = document.getElementById("js-click"+data[i]);
			            const value = classAccordion.clientHeight;	        
			            if (parseInt(value) > 100) {
			                expande.style.display = 'block';
			                classAccordion.style.maxHeight ='100px';
			            }
	        		}
	        	}
	        }
			function myfunction(value,userValue,idValue){
				CKEDITOR.config.allowedContent = true;
				var id = parseInt(data[data.length-1])+1;
				console.log(id);
				const comment = document.getElementById(value);
				const user = document.getElementById(userValue);
				CKEDITOR.addCss( '.cke_editable blockquote {border-color:#ff944d}');
				CKEDITOR.addCss( '.cke_editable blockquote div div em {display:none}');
				CKEDITOR.addCss( '.cke_editable blockquote {font-family:Times New Roman,Times,serif}');
				CKEDITOR.addCss( '.cke_editable blockquote {background:#e2e3e5}');
				CKEDITOR.addCss( '.cke_editable blockquote div {background-color:#ebeced}');

				var value = editor.setData('<blockquote class="bbCodeBlock bbCodeBlock--expandable">'
						+'<div class="container-collapse"><div class="accordion" id="accordion'+id+'">'
						+'<div class="bbCodeBlock-title"><p><span style="font-size:20px;color: #ff944d;">'
						+user.textContent+':</span></p></div>'
						+'<span style="font-family:Times New Roman,Times,serif;font-size:14px;">'
						+comment.innerHTML
						+'</span></div>'
						+'<i id="1"><div class="bbCodeBlock-expandLink" id="js-click'+id+'" onclick="showExpand('+'\''+id+'\''+')">'
						+'<a role="button" tabindex="0">Click to expand...</a></div></i></div></blockquote>'
						+'<div id="value-comment'+id+'"><p></p></div>');
		}
	        function showExpand(idValue) {
	        	const classAccordion = document.getElementById("accordion"+idValue);
	        	const expande = document.getElementById("js-click"+idValue);
		        classAccordion.style.maxHeight = "100%";
		        expande.style.display = "none";
		        console.log("true");
	        }
	        function checkInput(){
	        	var check=true;
	  		  var comment = document.getElementById("namComment");
				var id = parseInt(data[data.length-1])+1;
				const commentContent = document.getElementById("comment-content");
	  			if(comment.value===""){
	  				setErrorFor(comment, "Vui lòng nhập nick name của bạn!");
	  				check=false;
	  			}else{
	  				setSuccesFor(comment);
	  			}
	  			var test = editor.getData().trim();
	  			console.log(test.length);

	  			return check;
	  	  }
	  	  
	  	  function setErrorFor(input, message) {
	  		    const formControl = input.parentElement;

	  		    const small = formControl.querySelector('small');

	  		    small.innerText = message;
	  		    formControl.className = 'name-comment error';
	  		}

	  		function setSuccesFor(input) {
	  		    const formControl = input.parentElement;
	  		    formControl.className = 'name-comment success';
	  		}
	  		submit.addEventListener("click",function(event){
	  			if (checkInput() === true) {
	  				
	  	        } else {
	  	        	event.preventDefault();
	  	        }
	  		});
	        disExpand();
	</script>
</body>
</html>