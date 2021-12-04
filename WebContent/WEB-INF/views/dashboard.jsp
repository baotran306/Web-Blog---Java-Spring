<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="${pageContext.servletContext.contextPath }/">
<!DOCTYPE html>
<html>
<head>
<title>Quản lí danh mục</title>
</head>
<body>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<link href="<c:url value="/resources/bootstrap/css/styles.css" />"
		rel="stylesheet">

<script src="https://raw.githubusercontent.com/google/palette.js/master/palette.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/bootstrap/js/scripts.js" />"></script>
	<script src="<c:url value="/resources/bootstrap/js/chartjs-plugin-colorschemes.js" />"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
		crossorigin="anonymous"></script>

	<%@include file="/WEB-INF/views/navbar.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@include file="/WEB-INF/views/layout_side.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Charts</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="admin/home.htm">Dashboard</a></li>
						<li class="breadcrumb-item active">Charts</li>
					</ol>
					<div>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> Thống kê lượt xem của Blog
							</div>
							<div class="card-body">
								<canvas id="chartBlog" width="100%" height="50"></canvas>
							</div>

							<div class="card-footer small text-muted">
								<p id="datetime"></p>

							</div>
						</div>
					</div>
					<div class="row">

						<div class="col-lg-6" >
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-pie me-1"></i> Thống kê lượt xem của
									danh mục
								</div>
								<div class="card-body">
									<canvas id="chartCategory" width="100%" height="50"></canvas>
								</div>
								<div class="card-footer small text-muted">
									<p id="datetime1"></p>
								</div>
							</div>
						</div>
						<div class="col-lg-6" >
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-pie me-1"></i> Thống kê lượt bình luận của
									danh mục
								</div>
								<div class="card-body">
									<canvas id="chartCategoryComment" width="100%" height="50"></canvas>
								</div>
								<div class="card-footer small text-muted">
									<p id="datetime2"></p>
								</div>
							</div>
						</div>
					</div>
			</main>

		</div>
		<script>
			var blogNames = [], blogViews = [];	
			var blogName, blogView, categoryName, categoryView;
			<c:forEach var="blog" items="${blogs}">
			blogName = '${blog.title}';
			blogView = '${blog.views}';
			blogNames.push(blogName);
			blogViews.push(blogView);
			</c:forEach>

			Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#292b2c';

			// Bar Chart Example
			var ctx = document.getElementById("chartBlog");
			var myLineChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : blogNames,
					datasets : [ {
						label : "Revenue",
						backgroundColor : "rgba(2,117,216,1)",
						borderColor : "rgba(2,117,216,1)",
						data : blogViews,
					} ],
				},
				options : {
					scales : {
						xAxes : [ {
							barPercentage : 0.2,
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false
							},
							ticks : {
								maxTicksLimit : 6
							}
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								maxTicksLimit : 5
							},
							gridLines : {
								display : true
							}
						} ],
					},
					legend : {
						display : false
					}
				},
				plugins : [ {
					beforeInit : function(chart) {
						chart.data.labels
								.forEach(function(value, index, array) {
									if (value.length > 30)
										value = value.substring(0, 27) + '...';
									array[index] = value;
								})
					}
				} ]
			});

			
		</script> 
		<script>
		var categoryName, categoryView;
		var categoryNames =  [];
		var categoryViews = [];
		var categoryComments = [];
		var view = 0;
		var comment = 0;
		<c:forEach var="category" items="${categorys}">
			categoryName = '${category.nameCategory}';
				 view = 0;
				 comment = 0;
				<c:forEach var="blog" items="${category.getBlog()}">
					blogView = '${blog.views}';
					cnt = '${blog.getComment().size()}';
					view = +view + +blogView;
					comment = +comment + +cnt;
			</c:forEach>
			categoryNames.push(categoryName);
			categoryViews.push(view);
			categoryComments.push(comment);
		</c:forEach>

		var ctx = document.getElementById("chartCategory");
		var myPieChart = new Chart(ctx, {
		  type: 'pie',
		  data: {
		    labels: categoryNames,
		    datasets: [{
		      data: categoryViews,
		     
		    }],
		  },
		  options: {

			    plugins: {

			      colorschemes: {

			        scheme: 'tableau.Tableau20'

			      }

			    }

			  }
		});
		
		var ctx = document.getElementById("chartCategoryComment");
		var myPieChart = new Chart(ctx, {
		  type: 'pie',
		  data: {
		    labels: categoryNames,
		    datasets: [{
		      data: categoryComments,
		     
		    }],
		  },
		  options: {

			    plugins: {

			      colorschemes: {

			        scheme: 'tableau.Tableau20'

			      }

			    }

			  }
		});
		
		</script>
		<script>
			var dt = new Date();
			document.("datetime").innerHTML = 'Cập nhật vào lúc:'
					+ dt.toLocaleString();
			document.("datetime1").innerHTML = 'Cập nhật vào lúc:'
				+ dt.toLocaleString();
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
</body>
</html>









