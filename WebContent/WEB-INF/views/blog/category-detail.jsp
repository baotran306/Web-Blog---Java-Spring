
    <%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.web.entity.Blog"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath }/">
	<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
		<script src="<c:url value="/assets/fontawesome/js/all.min.js" />"></script>
		<script src="<c:url value="/assets/plugins/popper.min.js" />"></script>
		<script
			src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="resources/css/menu-bar-style.css" />" rel="stylesheet">
	<style type="text/css">
body{
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
.card-body{
    background-color: #d3d5d7;
}
.category{
	color:  #dce7f5
}
.category:hover {
	color: #ff944d;
	text-decoration: underline;
}
.title{
			grid-area:title;
		}
		.infor{
			grid-area:infor;
		}
		.card-header{
			background-color: #5c7099;
		}
		.form-menu-category{
			 display: grid;
			 height:auto;				
			 width:100%;
			 grid-template-columns: 0.7fr 0.3fr;
			 grid-template-rows: 1fr;
			 grid-template-areas:"title infor";
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
	<p style="color: #fff;font-size: 14px">
		<a href="category/home.htm">
			<span class="category">Danh mục<span>
		</a>
		<i class="fas fa-chevron-right"></i>
				
	</p>
	<%
	List<Blog> blogs1 = (List<Blog>)request.getAttribute("requestBlogs");

	JSONArray arrList = new JSONArray();
	for(Blog blog:blogs1){
		JSONObject jsonObject = new JSONObject();
		String title=blog.getTitle();
		String id = String.valueOf(blog.getId());
		String tagBlog = blog.getTagBlog();
		String views = String.valueOf(blog.getViews());
		String comment = String.valueOf(blog.getComment().size());
		String dateCreated = blog.getDateCreated().toString();
        jsonObject.put("title",title);
        jsonObject.put("id",id);
        jsonObject.put("tagBlog",tagBlog);
        jsonObject.put("views",views);
        jsonObject.put("comment",comment);
        jsonObject.put("dateCreated", dateCreated);
		arrList.add(jsonObject);
	}
	 
%>
<div class="main-wrapper">
		<div >
			<div class="card" >
			<div class="card-header" style="color:white">${category.getNameCategory()}</div>
			<div class="card-body">
			<div class="name-comment">
				<table>
					<tr>
						<td>
							<span class="fas fa-search" style="font-size:30px"></span>
						</td>
						<td>
							<input style="margin-left: 10px;width:1000px" type="text" class="form-control" id="searchTitle" onkeyup="myFunction()" placeholder="Tiêu đề blog"> 						
						</td>
					</tr>
				</table>
			</div>
			<hr>
				<c:choose>
					<c:when test="${blogs.size()!=0 }">
					<div id="container-blog">
					<c:forEach items="${blogs }" var="blog">
				 	<div class="form-menu-category" id="blog-title">
						<div class="title">
							<i class="fas fa-blog"></i>
							<span><a href="blog/t/${blog.tagBlog}.htm?page=1"><b>${blog.getTitle() }</b></a></span>
							<p style="font-size:16px;padding-left:40px"><i class="fas fa-user-shield"> </i> Đăng bởi admin</p>
						</div>
						<div class="infor" id="info">
							<table style="width: 100%">
								<thead>
									<th style="margin-right: 5px;text-align: center;">Lượt xem</th>
									<th style="text-align: center;margin-right: 5px;">bình luận</th>
									<th style="text-align: center;">Thời gian đăng</th>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center;">
											${blog.views }
										</td>
										<td style="text-align: center;">${blog.getComment().size() }</td>
									    <td style="text-align: center;">${blog.dateCreated }</td>
										
									</tr>
								</tbody>
							</table>
						</div>
					</div>
						<hr>
						<!--//item-->
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
				        <p>Chưa có blog nào</p>
				    </c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript" >
	var value = <%=arrList%>;
	function myFunction(){
		const data = document.getElementById('searchTitle');
		console.log(data.value);
		var dataOb = FilterFunction(data.value,value)
		rebuildTable(dataOb);
	}
	function FilterFunction(value, data) {
        var filterData = [];
        for (var i = 0; i < data.length; i++) {
            value = value.toLowerCase();
            console.log(data[i].title);
            var title = data[i].title.toLowerCase();
            if (title.includes(value)) {
                filterData.push(data[i]);
                console.log("check");
            }
        }
        return filterData;
	}
	function rebuildTable(data) {
		var div = document.getElementById('container-blog');
		div.innerHTML=`<div></div>`;
		for(var i=0;i<data.length;i++){
			var data1 = data[i].title;
			var row =`
			 	<div class="form-menu-category" id="blog-title">
				<div class="title">
				<i class="fas fa-blog"></i>
				<span><a href="blog/t/`+data[i].tagBlog+`.htm?page=1"><b>`+data[i].title+`</b></a></span>
				<p style="font-size:16px;padding-left:40px"><i class="fas fa-user-shield"> </i> Đăng bởi admin</p>
			</div>
			<div class="infor" id="info">
				<table style="width: 100%">
					<thead>
						<th style="margin-right: 5px;text-align: center;">Lượt xem</th>
						<th style="text-align: center;margin-right: 5px;">bình luận</th>
						<th style="text-align: center;">Thời gian đăng</th>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center;">
								`+data[i].views+`
							</td>
							<td style="text-align: center;">`+data[i].comment+`</td>
						    <td style="text-align: center;">`+data[i].dateCreated+`</td>							
						</tr>
					</tbody>
				</table>
			</div>
			</div> <hr>`
			div.innerHTML += row;
		}
	}
</script>
	
</body>
</html>