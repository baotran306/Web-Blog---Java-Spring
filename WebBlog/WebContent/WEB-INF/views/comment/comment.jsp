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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
	<style>
		body{
			background-color: #15191d;
		}
		.container{
			 display: grid;
			 min-height: 100vh;			
			 width:100%;
			 grid-template-columns: 1fr;
			 grid-template-rows: 0.2fr 1.4fr 0.4fr;
			 grid-template-areas: "header" "container-body" "container-comment";
		}
		header{
			grid-area:header;
			background-color: red;
		}
		.container-body{
			grid-area:container-body;	
			margin-bottom: 10px;
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
			position: relative;
			width:auto;
			height:auto;
			position: relative;
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
		}
		.container-replay a span{
		 	color:blue;
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
			width: 80%;
			height: auto;
			margin: 5px;
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
			top: 5px;
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
            max-width: 80rem;
            margin: 0 auto;
            padding: 0 1rem;
            position: relative;
        }
        
        .accordion {
            color: #15191d;
            background: #ebeced;
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
        /* 
        .bbCodeBlock {
            display: flow-root;
            margin: 0.5rem 0;
            background: #e2e3e5;
            border: 1px solid #d3d5d7;
            border-left: 4px solid #ff944d;
            grid-area:bbCodeBlock;
             overflow: hidden;
            -webkit-transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;
            transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;
        } */
        
        /* .bbCodeBlock--expandable {
            overflow: hidden;
            -webkit-transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;
            transition: -xf-height 0.25s ease, height 0.25s ease, padding 0.25s ease, margin 0.25s ease, border 0.25s ease;
        } */
        
        .bbCodeBlock-expandLink {
            display: none;
            position: absolute;
            top: 38px;
            left: 0;
            right: 0;
            height: 75px;
            cursor: pointer;
            z-index: 100;
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
        .card-comment{
        	margin-top:10px;
        	width:100%;
        	height:auto;
        	background-color: #ebeced;
        	display:grid;
        	position:relative;
        	border-radius:5px;
			grid-template-columns: 0.2fr 0.8fr;
			grid-template-rows: 0.8fr 0.2fr;
			grid-template-areas: "box-user box-comment" "box-user container-replay";
        }        
	</style>
</head>
<body>
	<div class ="container">
		<header>
			Blog
		</header>
 		<div class="container-body" >
			<!-- 		 	<div class="card-comment">
					<div class="box-user">
						<p id="name-comment">user</p>
					</div> -->
					
				<!-- <div class ="box-comment" id="box-comment">
				-->	
						<% 
						ArrayList<Comment> std = (ArrayList<Comment>)request.getAttribute("comments");
       					 for(Comment c:std){
       						out.write("<div class=\"card-comment\">"
       					 				+"<div class=\"box-user\">"
       									+"<p id=\"name-comment"+c.getIdComment()+"\">"+c.getNameComment()+"</p>"
			       					 	+"</div>"
       									+"<div class =\"box-comment\" id=\"box-comment\">"
			       						+c.getContentBlog()			       				
			       						+"<hr>"
			       						+"<div class=\"container-replay\">"
			       						+"<a class=\"replay\" onclick=\"myfunction('value-comment"+c.getIdComment()+"','name-comment"+c.getIdComment()+"',"+c.getIdComment()+")\">"
			       						+"<span class=\"fas fa-reply\"> Replay</span>"
			       						+"</a></div></div></div>"); 
       					 };%>
						
						<!-- 	<blockquote class="bbCodeBlock bbCodeBlock--expandable">
							<blockquote>
					        <div class="container-collapse">
					            <div class="accordion" id="accordion3">
					                <p id="value-comment3">
					                    KINH DOANH TIÊU DÙNG Giá xăng tăng thêm 550-660 đồng/lít, cao nhất trong 7 năm Văn Hưng Thứ tư, 10/11/2021 14:44 (GMT+7)Từ 15h chiều 10/11, giá xăng E5 RON 92 trong nước tăng 550 đồng/lít còn xăng RON 95 tăng 660 đồng/lít. Chiều 10/11, liên Bộ Tài chính
					                    - Công Thương quyết định điều chỉnh giá bán lẻ xăng dầu theo chu kỳ 15 ngày/lần. Theo đó, giá xăng RON 95 được điều chỉnh tăng 660 đồng/lít, xăng E5 RON 92 tăng 550 đồng/lít. Mức giá bán lẻ tối đa với xăng E5 RON 92 là 23.660 đồng/lít.
					                     KINH DOANH TIÊU DÙNG Giá xăng tăng thêm 550-660 đồng/lít, cao nhất trong 7 năm Văn Hưng Thứ tư, 10/11/2021 14:44 (GMT+7)Từ 15h chiều 10/11, giá xăng E5 RON 92 trong nước tăng 550 đồng/lít còn xăng RON 95 tăng 660 đồng/lít. Chiều 10/11, liên Bộ Tài chính
					                    - Công Thương quyết định điều chỉnh giá bán lẻ xăng dầu theo chu kỳ 15 ngày/lần. Theo đó, giá xăng RON 95 được điều chỉnh tăng 660 đồng/lít, xăng E5 RON 92 tăng 550 đồng/lít. Mức giá bán lẻ tối đa với xăng E5 RON 92 là 23.660 đồng/lít.			                    
					                     KINH DOANH TIÊU DÙNG Giá xăng tăng thêm 550-660 đồng/lít, cao nhất trong 7 năm Văn Hưng Thứ tư, 10/11/2021 14:44 (GMT+7)Từ 15h chiều 10/11, giá xăng E5 RON 92 trong nước tăng 550 đồng/lít còn xăng RON 95 tăng 660 đồng/lít. Chiều 10/11, liên Bộ Tài chính
					                    - Công Thương quyết định điều chỉnh giá bán lẻ xăng dầu theo chu kỳ 15 ngày/lần. Theo đó, giá xăng RON 95 được điều chỉnh tăng 660 đồng/lít, xăng E5 RON 92 tăng 550 đồng/lít. Mức giá bán lẻ tối đa với xăng E5 RON 92 là 23.660 đồng/lít.			                    
					                     KINH DOANH TIÊU DÙNG Giá xăng tăng thêm 550-660 đồng/lít, cao nhất trong 7 năm Văn Hưng Thứ tư, 10/11/2021 14:44 (GMT+7)Từ 15h chiều 10/11, giá xăng E5 RON 92 trong nước tăng 550 đồng/lít còn xăng RON 95 tăng 660 đồng/lít. Chiều 10/11, liên Bộ Tài chính
					                    - Công Thương quyết định điều chỉnh giá bán lẻ xăng dầu theo chu kỳ 15 ngày/lần. Theo đó, giá xăng RON 95 được điều chỉnh tăng 660 đồng/lít, xăng E5 RON 92 tăng 550 đồng/lít. Mức giá bán lẻ tối đa với xăng E5 RON 92 là 23.660 đồng/lít.			                    			                    
					                </p>
					            </div>
							</div>
					            
					            </blockquote>
					            <div class="bbCodeBlock-expandLink" id="js-click">
					                <a role="button" tabindex="0">Click to expand...</a>
					            </div>
					       </blockquote>
					    <hr>
					    </div>
					    	<div class="container-replay">
						<a href="/WebBlog/blog/comment.htm#editor" class="replay" onclick="myfunction('value-comment','name-comment')">
						
						<span class="fas fa-reply"> Replay</span>
						</a>
					</div>
					</div>
					
					    -->											
		</div>
		<div class ="container-comment">
			<form action="blog/comment.htm" method="post" modelAttribute="comment">
				<div class="comment-size">
					<div class="name-comment">
						<input type="text" class="form-control" name="NameComment" placeholder="Name comment"> 
					</div>
					<div class="text-area">
						<%-- <form:textarea path="contentBlog" id="editor"></form:textarea> --%>
						<textarea rows="10" cols="20" name = "contentBlog" id="editor">
							<div id = "value-comment${comments.size()+1}">
								<p></p>
							</div>
						</textarea>	
					</div>
					<div class="button-submit">
						<button class="btn btn-primary" type="submit">
							<i class="fas fa-reply"></i>
							<span>Post Replay</span>
						</button>
					</div>			
				</div>	
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	 	 var editor = CKEDITOR.replace( 'editor');
	 	 CKEDITOR.config.removePlugins = 'magicline';
	 	 var data = new Array();
	 	 <%
	 	 	for(int i=0;i<std.size();i++){
	 	 %>
	 	 data[<%= i %>] = <%=std.get(i).getIdComment() %>;
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
				var id = data[data.length-1]+1;
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
						+'<p><span style="font-size:20px;color:#ff944d;">'
						+user.textContent+':</span></p>'
						+'<span style="font-family:Times New Roman,Times,serif;font-size:14px;">'
						+comment.innerHTML
						+'</span></div>'
						+'<i id="1"><div class="bbCodeBlock-expandLink" id="js-click'+id+'" onclick="showExpand('+'\''+id+'\''+')">'
						+'<a role="button" tabindex="0">Click to expand...</a></div></i></div></blockquote>'
						+'<div id="value-comment'+id+'"><p></p></div>');
				/* var value = editor.setData(comment12); */
				alert(editor.getData());
		}
	        function showExpand(idValue) {
	        	const classAccordion = document.getElementById("accordion"+idValue);
	        	const expande = document.getElementById("js-click"+idValue);
		        classAccordion.style.maxHeight = "100%";
		        expande.style.display = "none";
		        console.log("true");
	        }
	        disExpand();
	</script>
</body>
</html>