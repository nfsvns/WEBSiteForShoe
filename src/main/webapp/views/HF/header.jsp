<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/views/HF/link.jsp"></jsp:include>
</head>
<body style="padding-top: 0px">
<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">info@company.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-020-0340">010-020-0340</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo"
						target="_blank" rel="sponsored"><i
						class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a
						class="text-light" href="https://www.instagram.com/"
						target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light"
						href="https://www.linkedin.com/" target="_blank"><i
						class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<div class="sticky-top bg-dark " style="opacity: 0.5">
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-white logo h1 align-self-center"
				style="margin-right: 180px;" href="index.html"> SNETHLIOS </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item "><a class="nav-link text-white" href="/index">Home</a>
						</li>
						<li class="nav-item "><a class="nav-link text-white" href="/about">About</a>
						</li>
						<li class="nav-item mt-2">
							<div class="dropdown">


								<label class="dropdown-toggle text-white" data-bs-toggle="dropdown" for="">Sneakers</label>

								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/nike">Nike</a></li>
									<li><a class="dropdown-item" href="/adidas">Adidas</a></li>
									<li><a class="dropdown-item" href="/mlb">MLB</a></li>
								</ul>
							</div>
						</li>
						<li class="nav-item "><a class="nav-link text-white" href="/contact">Contact</a>
						</li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa-sharp fa-light fa-magnifying-glass" style="color: #c9d8f2;"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-white mr-2"></i>
					</a> 
					<a class="nav-icon  text-decoration-none" href="/cart">
						<span style="font-size: 20px; margin-left: 1px;padding-top: 10px">${cartQuantity}</span><i class="fa fa-fw fa-cart-arrow-down text-white mr-1">  </i>
                        
					</a>
					
					<div class="dropdown">

						<i class="fa fa-fw fa-user text-white mr-3 dropdown-toggle"
							data-bs-toggle="dropdown"></i>

						<ul class="dropdown-menu">
						<c:choose>
						<c:when test="${empty sessionScope.user}">
						<li><a class="dropdown-item " href="/login">Log in</a></li>
							<li><a class="dropdown-item " href="/signup">Sign up</a></li>
						</c:when>
						<c:otherwise>
						<li><a class="dropdown-item " href="">${sessionScope.user.username}</a></li>
						<li><a class="dropdown-item " href="/logout">Log out</a></li>
						</c:otherwise>
						</c:choose>
							
						<c:if test="${sessionScope.user.admin}">
						<li><a class="dropdown-item " href="/admin">Admin</a></li>
						</c:if>
						
		                
		                
		            
						
							
						</ul>
					</div>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	
</body>
</html>