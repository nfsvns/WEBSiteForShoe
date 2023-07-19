<%@ page pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Snethlios - ${item.name}</title>
<!-- <!-- <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

Load fonts style after rendering the layout styles
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

Slick
<link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css"> -->
<jsp:include page="/views/HF/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/views/HF/header.jsp"></jsp:include>
	<section class="bg-light">
		<div class="container pb-5">
			<div class="row">

				<div class="col-lg-5 mt-5">
					<div class="card mb-3">
						<img class="card-img img-fluid" src="${item.image}"
							alt="Card image cap" id="product-detail">
					</div>
					<div class="row">
						<!--Start Controls-->
						<div class="col-1 align-self-center">
							<a href="#multi-item-example" role="button" data-bs-slide="prev">
								<i class="text-dark fas fa-chevron-left"></i> <span
								class="sr-only">Previous</span>
							</a>
						</div>
						<!--End Controls-->
						<!--Start Carousel Wrapper-->
						<div id="multi-item-example"
							class="col-10 carousel slide carousel-multi-item"
							data-bs-ride="carousel">
							<!--Start Slides-->
							<div class="carousel-inner product-links-wap" role="listbox">

								<!--First slide-->
								<div class="carousel-item active">
									<c:forEach var="image" items="${item.images }">
										<div class="row">
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image.image1 }" alt="Product Image 4">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image.image2 }" alt="Product Image 5">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image.image3}" alt="Product Image 6">
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
								<!--/.First slide-->

								<!--Second slide-->
								<div class="carousel-item">
									<c:forEach var="image7" items="${item.images }">
										<div class="row">

											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image7.image4 }" alt="Product Image 4">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image7.image5 }" alt="Product Image 5">
												</a>
											</div>
											<div class="col-4">
												<a href="#"> <img class="card-img img-fluid"
													src="${image7.image6 }" alt="Product Image 6">
												</a>
											</div>

										</div>
									</c:forEach>
								</div>
								<!--/.Second slide-->

								<!--Third slide-->

								<!--/.Third slide-->
							</div>
							<!--End Slides-->
						</div>
						<!--End Carousel Wrapper-->
						<!--Start Controls-->
						<div class="col-1 align-self-center">
							<a href="#multi-item-example" role="button" data-bs-slide="next">
								<i class="text-dark fas fa-chevron-right"></i> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
				<!-- col end -->
				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2">${item.name}</h1>
							<p class="h3 py-2">${item.price}</p>
							<p class="py-2">
								<i class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-secondary"></i> <span
									class="list-inline-item text-dark">Rating 4.8 | 36
									Comments</span>
							</p>

							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>Avaliable Color :</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong>White / Black</strong>
									</p>
								</li>
							</ul>

							<h6>Specification:</h6>
							<ul class="list-unstyled pb-3">
								<li>Lorem ipsum dolor sit</li>
								<li>Amet, consectetur</li>
								<li>Adipiscing elit,set</li>
								<li>Duis aute irure</li>
								<li>Ut enim ad minim</li>
								<li>Dolore magna aliqua</li>
								<li>Excepteur sint</li>
							</ul>

							<form action="" method="GET">
								<input type="hidden" name="product-title" value="Activewear">
								<div class="row">
									<div class="col-auto">
										<ul class="list-inline pb-3">
											<li class="list-inline-item">Size : <input type="hidden"
												name="product-size" id="product-size" value="S">
											</li>
											<li class="list-inline-item"><span
												class="btn btn-dark btn-size">39</span></li>
											<li class="list-inline-item"><span
												class="btn btn-dark btn-size">40</span></li>
											<li class="list-inline-item"><span
												class="btn btn-dark btn-size">41</span></li>
											<li class="list-inline-item"><span
												class="btn btn-dark btn-size">42</span></li>
										</ul>
									</div>
									<div class="col-auto">
			
		
									</div>
								</div>
								<div class="row pb-3">
									<div class="col d-grid">
										<a href="/addtoCart/${item.id}">
											<button type="submit" class="btn btn-dark btn-lg"
												name="submit" value="addtocard">Buy</button>
										</a>

									</div>
									<div class="col d-grid">
										<a href="/add/${item.id}">
											<button type="submit" class="btn btn-dark btn-lg"
												name="submit" value="addtocard">Add To Cart</button>
										</a>

									</div>
	
								</div>
							</form>

						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<jsp:include page="/views/HF/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function updateQty(id) {
			location.href = "/detail/update?id=" + id + "&qty="
					+ document.getElementById(id + "input").value;
		}
	</script>
</body>
</html>
