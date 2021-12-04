<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Core</div>
			<a class="nav-link" href="admin/home.htm">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div> Dashboard
			</a>
			<div class="sb-sidenav-menu-heading">Interface</div>
			<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
				data-bs-target="#collapseLayouts" aria-expanded="false"
				aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="fas fa-columns"></i>
				</div> Danh mục
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseLayouts"
				aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="category/manager.htm">Quản lý</a> 
				</nav>
			</div>
			<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
				data-bs-target="#collapseBlog" aria-expanded="false"
				aria-controls="collapsePages">
				<div class="sb-nav-link-icon">
					<i class="fas fa-book-open"></i>
				</div> Blog
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseBlog"
				aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="blog/manager.htm?page=1">Quản lý</a> <a
						class="nav-link" href="blog/create.htm">Tạo mới</a>
				</nav>
			</div>

		</div>
	</div>

</nav>
</html>