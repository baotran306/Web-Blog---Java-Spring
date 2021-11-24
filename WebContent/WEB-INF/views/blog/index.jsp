<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath }/">
	<link href="<c:url value="assets/css/theme-1.css" />" rel="stylesheet">
		<script src="<c:url value="/assets/fontawesome/js/all.min.js" />"></script>
		<script src="<c:url value="/assets/plugins/popper.min.js" />"></script>
		<script
			src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>



		<!DOCTYPE html>
		<html lang="en">
<head>
<title>DevBlog - Bootstrap 5 Blog Template For Developers</title>

<!-- Meta -->
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta name="description" content="Blog Template">
				<meta name="author" content="Xiaoying Riley at 3rd Wave Media">
					<link rel="shortcut icon" href="favicon.ico">
</head>

<body>

	<header class="header text-center">
	<h1 class="blog-name pt-lg-4 mb-0">
		<a class="no-text-decoration" href="index.html">Anthony's Blog</a>
	</h1>

	<nav class="navbar navbar-expand-lg navbar-dark">

	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navigation" aria-controls="navigation"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div id="navigation" class="collapse navbar-collapse flex-column">
		<div class="profile-section pt-3 pt-lg-0">
			<img class="profile-image mb-3 rounded-circle mx-auto"
				src="assets/images/profile.png" alt="image">

				<div class="bio mb-3">
					Hi, my name is Anthony Doe. Briefly introduce yourself here. You
					can also provide a link to the about page.<br><a
						href="about.html">Find out more about me</a>
				</div>
				<!--//bio-->
				<ul class="social-list list-inline py-3 mx-auto">
					<li class="list-inline-item"><a href="#"><i
							class="fab fa-twitter fa-fw"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fab fa-linkedin-in fa-fw"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fab fa-github-alt fa-fw"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fab fa-stack-overflow fa-fw"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fab fa-codepen fa-fw"></i></a></li>
				</ul>
				<!--//social-list-->
				<hr>
		</div>
		<!--//profile-section-->

		<ul class="navbar-nav flex-column text-start">
			<li class="nav-item"><a class="nav-link active"
				href="index.html"><i class="fas fa-home fa-fw me-2"></i>Blog
					Home <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="blog-post.html"><i
					class="fas fa-bookmark fa-fw me-2"></i>Blog Post</a></li>
			<li class="nav-item"><a class="nav-link" href="about.html"><i
					class="fas fa-user fa-fw me-2"></i>About Me</a></li>
		</ul>

		<div class="my-2 my-md-3">
			<a class="btn btn-primary" href="https://themes.3rdwavemedia.com/"
				target="_blank">Get in Touch</a>
		</div>
	</div>
	</nav> </header>

	<div class="main-wrapper">

		<section class="cta-section theme-bg-light py-5">
		<div class="container text-center single-col-max-width">
			<h2 class="heading">DevBlog - A Blog Template Made For
				Developers</h2>
			<div class="intro">Welcome to my blog. Subscribe and get my
				latest blog post in your inbox.</div>
			<div class="single-form-max-width pt-3 mx-auto">
				<form class="signup-form row g-2 g-lg-2 align-items-center">
					<div class="col-12 col-md-9">
						<label class="sr-only" for="semail">Your email</label> <input
							type="email" id="semail" name="semail1"
							class="form-control me-md-1 semail" placeholder="Enter email">
					</div>
					<div class="col-12 col-md-2">
						<button type="submit" class="btn btn-primary">Subscribe</button>
					</div>
				</form>
				<!--//signup-form-->
			</div>
			<!--//single-form-max-width-->
		</div>
		<!--//container--> </section>


		<section class="blog-list px-3 py-5 p-md-5">

		<div class="container single-col-max-width">

			<c:forEach items="${blogs }" var="blog">
				<div class="item mb-5">
					<div class="row g-3 g-xl-0">
						<div class="col-2 col-xl-3">
							<img class="img-fluid post-thumb "
								src="assets/images/blog/blog-post-thumb-2.jpg" alt="image">
						</div>
						<div class="col">
							<h3 class="title mb-1">
								<a class="text-link" href="blog-post.html">${blog.title }</a>
							</h3>
							<div class="meta mb-1">
								<span class="date">${blog.dateCreated}</span><span class="time">Lược
									xem: ${blog.views}</span><span class="comment"><p>
										Thảo luận: ${blog.comment.size()}</a></span>
							</div>
							<c:if test="${blog.contentBlog.length() > 475 }">
								<div class="intro">${blog.contentBlog.substring(0,475) }</div>
							</c:if>
							<c:if test="${blog.contentBlog.length() <= 475 }">
								<div class="intro">${blog.contentBlog }</div>
							</c:if>
							<a class="text-link" href="blog/${blog.tagBlog }.htm">Read
								more &rarr;</a>
						</div>
						<!--//col-->
					</div>
					<!--//row-->
				</div>
				<!--//item-->
			</c:forEach>




			<nav class="blog-nav nav nav-justified my-5"> <a
				class="nav-link-prev nav-item nav-link d-none rounded-left" href="#">Previous<i
				class="arrow-prev fas fa-long-arrow-alt-left"></i></a> <a
				class="nav-link-next nav-item nav-link rounded" href="#">Next<i
				class="arrow-next fas fa-long-arrow-alt-right"></i></a> </nav>

		</div>
		</section>

		<footer class="footer text-center py-2 theme-bg-dark"> <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
		<small class="copyright">Designed with <i class="fas fa-heart"
			style="color: #fb866a;"></i> by <a
			href="https://themes.3rdwavemedia.com" target="_blank">Xiaoying
				Riley</a> for developers
		</small> </footer>

	</div>
	<!--//main-wrapper-->






</body>
		</html>