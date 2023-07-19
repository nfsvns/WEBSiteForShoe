<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Snethlios</title>
<script src="assets/js/jquery-1.11.0.min.js"></script>
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/templatemo.js"></script>
<script src="assets/js/custom.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
</head>
<body>
	<!-- Start Banner Hero -->
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
	<!-- carousel -->
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="assets/img/slide1.jpg" class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="assets/img/slide2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="assets/img/slide3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
		</a> <a class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
		</a>
	</div>

	<section class="section-products">
		
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>Sale Off</h3>
						<h2>Sale Products</h2>
						<h2>${mess}</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Single Product -->
				<c:forEach var="item" items="${products.content}">
					<div class="col-md-4">

						<div class="container page-wrapper">
							<div class="page-inner " style="margin-left: 30px">
								<div class="el-wrapper">
									<div class="box-up">
										<a href="/detail/${item.id}"> <img class="img"
											style="width: 90%" src="${item.image}" alt="">
										</a>

										<div class="img-info">
											<div class="info-inner">
												<span class="p-name">${item.name}</span>

											</div>
											<div class="a-size">
												Available sizes : <span class="size">40 41 42 43</span>
											</div>
										</div>
									</div>

									<div class="box-down">
										<div class="h-bg">
											<div class="h-bg-inner"></div>
										</div>
                                        <c:if test="${not empty sessionScope.username}">
                                         <a class="cart" href="/add/${item.id}"> <span class="price">${item.price} VND</span>
											<span class="add-to-cart"> <span class="txt">Add
													in cart</span>
										</span>
										</a>
                                        </c:if>
										
										 <a class="cart" href="/index"> <span class="price">${item.price} VND</span>
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
				<!-- Single Product -->
				<div div="row">
					<ul class="pagination pagination-lg justify-content-end">
						<li class="page-item"><a
							class="page-link  rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
							href="/index?p=0">&laquo;&laquo;</a></li>
						<li class="page-item"><a
							class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
							href="/index?p=${products.number-1}">&laquo;</a></li>



						<li class="page-item"><a
							class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
							href="/index?p=${products.number+1}">&raquo;</a></li>

						<li class="page-item"><a
							class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
							href="/index?p=${products.totalPages-1}">&raquo;&raquo;</a></li>
					</ul>
				</div>

			</div>
		</div>
	</section>

	<!-- Start Categories of The Month -->
	<section class="container py-5">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1 text-dark">
					<strong>FAMOUS SNEAKER BRANDS</strong>
				</h1>
				<p>Here are the famous shoe brands, these shoe brands are widely
					used and favored by the shoe community across the country.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="/nike"><img src="./assets/img/nike1.jpg"
					class="rounded-circle img-fluid border"></a>
				<h5 class="text-center mt-3 mb-3">Nike</h5>
				<p class="text-center">
					<a href="/nike" class="btn btn-dark">Go Shop</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="/adidas"><img src="./assets/img/adidas1.jpg"
					class="rounded-circle img-fluid border"></a>
				<h2 class="h5 text-center mt-3 mb-3">Adidas</h2>
				<p class="text-center">
					<a href="/adidas" class="btn btn-dark">Go Shop</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="/mlb"><img src="./assets/img/mlb.jpg"
					class="rounded-circle img-fluid border"></a>

				<h2 class="h5 text-center mt-3 mb-3">MLB</h2>
				<p class="text-center">
					<a href="/mlb" class="btn btn-dark">Go Shop</a>
				</p>
			</div>
		</div>
	</section>
	<!-- End Categories of The Month -->


	<!-- Start Featured Product -->
	<section class="bg-light">
		<div class="container py-5">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Featured Product</h1>
					<p>Reprehenderit in voluptate velit esse cillum dolore eu
						fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="shop-single.html"> <img src="./assets/img/mlb.jpg"
							class="card-img-top img-fluid" alt="...">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-muted fa fa-star"></i> <i
									class="text-muted fa fa-star"></i></li>

								<li class="text-right text-danger" style="margin-left: 100px;">
									<del>$320.00</del>
								</li>
								<li class=" text-right text-dark"><strong>$240.00
								</strong></li>
							</ul>

							<a href="shop-single.html"
								class="h2 text-decoration-none text-dark">MBL SNEAKER</a>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Sunt in culpa qui officia deserunt.</p>
							<p class="text-muted">Reviews (24)</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="shop-single.html"> <img
							src="./assets/img/adidas2.jpg" class="card-img-top " alt="...">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-muted fa fa-star"></i> <i
									class="text-muted fa fa-star"></i></li>
								<li class="text-muted text-right">$480.00</li>
							</ul>
							<a href="shop-single.html"
								class="h2 text-decoration-none text-dark">Cloud Nike Shoes</a>
							<p class="card-text">Aenean gravida dignissim finibus. Nullam
								ipsum diam, posuere vitae pharetra sed, commodo ullamcorper.</p>
							<p class="text-muted">Reviews (48)</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="shop-single.html"> <img src="./assets/img/nike2.jpg"
							class="card-img-top" alt="...">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i></li>
								<li class="text-muted text-right">$360.00</li>
							</ul>
							<a href="shop-single.html"
								class="h2 text-decoration-none text-dark">NIKE SNEAKERS</a>
							<p class="card-text">Curabitur ac mi sit amet diam luctus
								porta. Phasellus pulvinar sagittis diam, et scelerisque ipsum
								lobortis nec.</p>
							<p class="text-muted">Reviews (74)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Featured Product -->
	<section class="section-products">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>New</h3>
						<h2>Products</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Single Product -->
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div id="product-1" class="single-product">
						<div class="part-1">
							<img src="assets/img/nike5.jpg" class="img-fluid hover-zoom"
								alt=""> <span class="new">NEW</span>
							<ul>
								<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
								<li><a href="#"><i class="fas fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-plus"></i></a></li>
								<li><a href="#"><i class="fas fa-expand"></i></a></li>
							</ul>
						</div>
						<div class="part-2">
							<h3 class="product-title text-center text-success">Giày EI
								-Sacai x Blazer Mid Off-White - Women / 7.5</h3>
							<h4 class="product-old-price text-center text-danger"
								style="margin-left: 100px;">$79.99</h4>
							<h4 class="product-price">$49.99</h4>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div id="product-1" class="single-product">
						<div class="part-1">
							<img src="assets/img/adidas4.jpg" class="img-fluid hover-zoom"
								alt=""> <span class="new">NEW</span>
							<ul>
								<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
								<li><a href="#"><i class="fas fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-plus"></i></a></li>
								<li><a href="#"><i class="fas fa-expand"></i></a></li>
							</ul>
						</div>
						<div class="part-2">
							<h3 class="product-title text-center text-success">Giày
								Forum Low Shoes Cloud White Kids Basketball</h3>
							<h4 class="product-old-price text-center text-danger"
								style="margin-left: 100px;">$79.99</h4>
							<h4 class="product-price">$49.99</h4>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div id="product-1" class="single-product">
						<div class="part-1">
							<img src="assets/img/adidas5.jpg" class="img-fluid hover-zoom"
								alt=""> <span class="new">NEW</span>
							<ul>
								<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
								<li><a href="#"><i class="fas fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-plus"></i></a></li>
								<li><a href="#"><i class="fas fa-expand"></i></a></li>
							</ul>
						</div>
						<div class="part-2">
							<h3 class="product-title text-center text-success">Giày
								Adidas Forum Bonega X Shoes - Beige</h3>
							<h4 class="product-old-price text-center text-danger"
								style="margin-left: 100px;">$79.99</h4>
							<h4 class="product-price">$49.99</h4>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div id="product-1" class="single-product">
						<div class="part-1">
							<img src="assets/img/converse4.jpg" class="img-fluid hover-zoom"
								alt=""> <span class="new">NEW</span>
							<ul>
								<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
								<li><a href="#"><i class="fas fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-plus"></i></a></li>
								<li><a href="#"><i class="fas fa-expand"></i></a></li>
							</ul>
						</div>
						<div class="part-2">
							<h3 class="product-title text-center text-success">Giày
								Converse Chuck Taylor All Star Eva Lift</h3>
							<h4 class="product-old-price text-center text-danger"
								style="margin-left: 100px;">$79.99</h4>
							<h4 class="product-price">$49.99</h4>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div id="product-1" class="single-product">
						<div class="part-1">
							<img src="assets/img/nike6.jpg" class="img-fluid hover-zoom"
								alt=""> <span class="new">NEW</span>
							<ul>
								<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
								<li><a href="#"><i class="fas fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-plus"></i></a></li>
								<li><a href="#"><i class="fas fa-expand"></i></a></li>
							</ul>
						</div>
						<div class="part-2">
							<h3 class="product-title text-center text-success">Giày Dunk
								Hi 1985 - Summit White/Barely Rose/University</h3>
							<h4 class="product-old-price text-center text-danger"
								style="margin-left: 100px;">$79.99</h4>
							<h4 class="product-price">$49.99</h4>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>


	<div class="container">
		<h3 class="text-center mb-5">HOT PRODUCTS</h3>
		<ul class="nav nav-tabs nav-justified mb-3" id="ex1" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="ex3-tab-1" data-bs-toggle="tab"
				href="#ex3-tabs-1" role="tab" aria-controls="ex3-tabs-1"
				aria-selected="true"> <strong>Nike</strong></a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="ex3-tab-2" data-bs-toggle="tab" href="#ex3-tabs-2" role="tab"
				aria-controls="ex3-tabs-2" aria-selected="false"><strong>Adidas</strong></a>
			</li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="ex3-tab-3" data-bs-toggle="tab" href="#ex3-tabs-3" role="tab"
				aria-controls="ex3-tabs-3" aria-selected="false"><strong>Convers</strong></a>
			</li>
		</ul>

		<div class="tab-content" id="ex2-content">
			<div class="tab-pane fade show active" id="ex3-tabs-1"
				role="tabpanel" aria-labelledby="ex3-tab-1">
				<section class="section-products">
					<div class="container">
						<div class="row">
							<!-- Single Product -->
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_1.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike The One Sneaker Trend No One Will Be Wearing In 2018</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_2.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike Court Legacy Lift Women's Shoes. Nike.com</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_3.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike SB Nyjah Free 2 Skate Shoe. Nike IE</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_4.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike By You Custom Shoes Branco/Preto</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_5.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike Blazer Mid '77 Vintage Men's Shoes</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_6.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike Air Force 1 Low By You Custom Women's Shoes</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_7.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike Court Borough Turnschuhe Sneaker Für Kinder Cd7782-110</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/nike1_8.jpg" class="img-fluid hover-zoom"
											alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Giày
											Nike Jordan Brand Air Jordan 1 Phat (GS) - 110617 - SNS</h3>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
			</div>
			<div class="tab-pane fade" id="ex3-tabs-2" role="tabpanel"
				aria-labelledby="ex3-tab-2">
				<section class="section-products">
					<div class="container">
						<div class="row">
							<!-- Single Product -->
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_1.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">adidas
											Forum 84 Low ADV Shoes - White | Men's Basketball | adidas US</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_2.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">adidas
											The Velosamba Vegan Cycling Shoes - White | Unisex Cycling |
											adidas US</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_3.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">adidas
											Forum Low Shoes - White | Unisex Lifestyle | adidas US</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_4.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">adidas
											Forum Low Shoes - Beige | Women's Basketball | adidas US</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_5.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Tênis
											Adidas Originals Superstar Bonega Branco/Vermelho GY6793.38</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_6.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Adidas
											Forum Low White Green - 12</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_7.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Adidas
											Tênis Breaknet</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/adidas1_8.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">adidas
											Forum 84 Low ADV Shoes - White | Men's Basketball | adidas US</h3>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
			</div>
			<div class="tab-pane fade" id="ex3-tabs-3" role="tabpanel"
				aria-labelledby="ex3-tab-3">
				<section class="section-products">
					<div class="container">
						<div class="row">
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/converse1_1.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Converse
											Chuck 70 Hi Black/Egret - 13</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/converse1_2.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Womens
											Converse Run Star Hike Hi White 166799c Us W 6.5 - 8.5 Takse</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/converse1_3.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">W
											Chuck Taylor All Star Move Platform 'Black/Natural' - 6.5</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/convers1_4.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Converse
											Chuck Taylor All Star Platform Lift "White" Women's Shoe</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/convers1_5.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Converse
											Chuck Taylor All Star High Top Shoes</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/convers1_6.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Converse
											Chuck 70 High Top Vintage Canvas Sneakers - A00754c 'utility'</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/convers1_7.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">Converse
											Mens Chuck Taylor All Star Cx Much Love 172948c Us M 6.0 -9.5
											Takse</h3>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4 col-xl-3">
								<div id="product-1" class="single-product">
									<div class="part-1">
										<img src="assets/img/convers1_8.jpg"
											class="img-fluid hover-zoom" alt="">

										<ul>
											<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
											<li><a href="#"><i class="fas fa-heart"></i></a></li>
											<li><a href="#"><i class="fas fa-plus"></i></a></li>
											<li><a href="#"><i class="fas fa-expand"></i></a></li>
										</ul>
									</div>
									<div class="part-2">
										<h4 class="product-price text-danger"
											style="margin-left: 130px;">$49.99</h4>
										<h3 class="product-title text-center text-success">CONVERSE
											Chuck Taylor All Star Lift Womens High Top Shoes - OLIVE |
											Tillys</h3>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<!-- blog -->
	<div class="container">
		<div id="template-mo-zay-hero-carousel" class="carousel slide"
			data-bs-ride="carousel">
			<ol class="carousel-indicators">
				<!-- <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li> -->
				<!-- <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li> -->
				<!-- <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li> -->
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<div class="row p-5">
							<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
								<img class="img-fluid" src="./assets/img/client1.jpg" alt="">
							</div>
							<div class="col-lg-6 mb-0 d-flex align-items-center">
								<div class="text-align-left align-self-center">
									<h3 class="h2 text-center ">
										<strong>"QUỐC THẮNG" </strong>
									</h3>
									<p class="text-center">“Mua giày chính hãng ở Snethlios lúc
										nào cũng được take care kỹ càng. Các bạn nhân viên check ib
										nhiệt tình, mình nhắn lúc 10, 11 giờ đêm vẫn được rep. Riết
										rồi Snethlios thành shop “ruột” của mình lúc nào không hay.
										Chúc shop luôn làm ăn phát đạt!”</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<div class="row p-5">
							<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
								<img class="img-fluid" src="./assets/img/client2.jpg" alt="">
							</div>
							<div class="col-lg-6 mb-0 d-flex align-items-center">
								<div class="text-align-left align-self-center">
									<h3 class="h2 text-center ">
										<strong>"PUN MILK" </strong>
									</h3>
									<p class="text-center">“Mới tậu một em Nike Air Jordan của
										shop. Giày full box đầy đủ tem mác chính hãng, đúng là đắt xắt
										ra miếng, đi vào rất êm chân. Mới lần đầu mua hàng và được các
										bạn nhân viên tư vấn rất tận tình. Chắc chắn sẽ còn ủng hộ
										shop trong thời gian tới.”</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<div class="row p-5">
							<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
								<img class="img-fluid" src="./assets/img/client3.jpg" alt="">
							</div>
							<div class="col-lg-6 mb-0 d-flex align-items-center">
								<div class="text-align-left align-self-center">
									<h3 class="h2 text-center ">
										<strong>"HOT GIRL THẢO MY" </strong>
									</h3>
									<p class="text-center">“Mình là dân tập thể thao nên khá
										khó tính khi chọn giày. Tình cờ được một người bạn giới thiệu
										đến với Snethlios và cảm thấy cực kỳ ưng ý. Mấy đôi Adidas,
										Nike, Jordan mình mua ở shop dùng lâu rồi mà vẫn như mới. Giày
										chất mà giá lại hợp lý.”</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev text-decoration-none w-auto ps-3"
				href="#template-mo-zay-hero-carousel" role="button"
				data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
			</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
				href="#template-mo-zay-hero-carousel" role="button"
				data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
			</a>
		</div>
	</div>

	<div class="container">
		<div class="card mt-5 border-light">
			<h3 class="text-center">BLOG</h3>
			<div class="card-body border-light">
				<div class="row">
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog1.webp" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Top 5 Mẫu
								giày Air Force 1 (AF1) trắng đen đáng sở hữu 2023</h6>
						</div>
					</div>
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog2.webp" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Điều gì
								khiến G-Dragon x Kwondo 1 Yin-Yang Peaceminusone ‘Panda’ trở
								thành một hiện tượng trong thế giới thời trang?</h6>
						</div>
					</div>
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog3.jpg" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Top 5 Mẫu
								giày Converse trắng đen đẹp khiến giới trẻ mê mẩn</h6>
						</div>
					</div>
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog4.webp" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Top 8 Mẫu
								Giày Jordan 1 Trắng Đen HOT TREND Nhất 2023</h6>
						</div>
					</div>
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog5.jpeg" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Top 10+
								đôi giày trắng đen kinh điển phải có trong tủ giày 2023</h6>
						</div>
					</div>
					<div class="col-sm-4 col-6 col-md-4">
						<div class="card-body">
							<img style="margin-top: 40px; height: 180px; width: 100%"
								src="assets/img/blog6.png" alt="">
						</div>
						<div class="part-2">
							<h6 class="product-title text-center text-success">Những
								Hình Ảnh Chính Thức Của Nike Ja 1 “Mismatch”</h6>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>