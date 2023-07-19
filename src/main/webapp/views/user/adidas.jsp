<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>
<title>Snethlios</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<jsp:include page="/views/HF/link.jsp"></jsp:include>
</head>

<body ng-app="myapp">
	<!-- Start Content -->
	<jsp:include page="/views/HF/header.jsp"></jsp:include>
	<div class="container py-5">
				<div style="text-align: center;">
					<span
						style="text-align: center; font-weight: bold; font-size: 50px;">Adidas's
						Product</span>
				</div>

				<div class="row">
				<c:forEach var="item" items="${products.content}">
				<div class="col-6 col-sm-8 col-md-6 col-lg-4">


					<div class="container page-wrapper">
						<div class="page-inner " style="margin-left: 30px">
							<div class="el-wrapper">
								<div class="box-up">
									<a href="/detail/${item.id}">
        <img class="img" style="width: 90%" src="${item.image}" alt="">
        </a>
									<div class="img-info">
										<div class="info-inner">
											<span class="p-name">${item.name}</span>

										</div>
										<div class="a-size">
											Available sizes : <span class="size">40 , 41 , 42 , 43</span>
										</div>
									</div>
								</div>

								<div class="box-down">
									<div class="h-bg">
										<div class="h-bg-inner"></div>
									</div>

									<a class="cart" href="/addtoCart/${item.id}"> <span class="price">${item.price}</span>
										<span class="add-to-cart"> <span class="txt">Add
												in cart</span>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>


				</div>
			</c:forEach>
			</div>
			<div div="row">
			<ul class="pagination pagination-lg justify-content-end">
				<li class="page-item"><a
					class="page-link  rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="/adidas?p=0">&laquo;&laquo;</a></li>	
			     <li class="page-item"><a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="/adidas?p=${products.number-1}">&laquo;</a></li>
			     
				
				
					<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="/adidas?p=${products.number+1}">&raquo;</a></li>
			
					<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="/adidas?p=${products.totalPages-1}">&raquo;&raquo;</a></li>
			</ul>
		</div>
	
	<!-- End Content -->

	<!-- Start Brands -->
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Our Brands</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod Lorem ipsum dolor sit amet.</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="prev"> <i
								class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0"
								id="multi-item-example" data-bs-ride="carousel">
								<!--Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<div class="carousel-item active">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End First slide-->

									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Second slide-->

									<!--Third slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Third slide-->

								</div>
								<!--End Slides-->
							</div>
						</div>
						<!--End Carousel Wrapper-->

						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="next"> <i
								class="text-light fas fa-chevron-right"></i>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--End Brands-->
    <jsp:include page="/views/HF/footer.jsp"></jsp:include>


	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->
</body>

</html>