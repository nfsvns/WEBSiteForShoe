<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>AdminLTE 3 | DataTables</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../../plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<jsp:include page="/views/HF/headerAd.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Quản lý đơn hàng</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">DataTables</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<!-- /.card -->


							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Quản lý tài khoản</h3>
								</div>
								<form action="/admin/reportProducts" modelAttribute="item">
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Id</label> <input type="text"
												class="form-control" id="exampleInputEmail1"
												placeholder="Id" name="id" value="${item.id}">
										</div>
	
<!-- 										<div class="form-group"> -->
<!-- 											<label for="exampleInputEmail1">OrderID</label> <br> <select -->
<!-- 												 name="order"> -->
<%-- 												<c:forEach items="${orders}" var="item"> --%>
<%-- 													<option value="${item.id}"> ${item.id} --%>
<!-- 													</option> -->
<%-- 												</c:forEach> --%>
<!-- 											</select> -->
<!-- 										</div> -->
										<div class="form-group">
											<label for="exampleInputEmail1">OrderId</label> <input type="text"
												class="form-control" id="exampleInputEmail1"
												placeholder="OrderID" name="order" value="${item.order.id}" >
										</div>
<!-- 										<div class="form-group"> -->
<!-- 											<label for="exampleInputEmail1">ProductID</label> <br> <select -->
<!-- 												 name="product"> -->
<%-- 												<c:forEach items="${products}" var="item"> --%>
<%-- 													<option value="${item.id}" >${item.id} --%>
<!-- 													</option> -->
<%-- 												</c:forEach> --%>
<!-- 											</select> -->
<!-- 										</div> -->
										<div class="form-group">
											<label for="exampleInputEmail1">ProductID</label> <input type="text"
												class="form-control" id="exampleInputEmail1"
												placeholder="ProductID" name="product" value="${item.product.id}" >
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Price</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="Id" name="price" value="${item.price}">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Quantity</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="Id" name="quantity" value="${item.quantity}">
										</div>




									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button formaction="/admin/createOrdeDetails" type="submit"
											class="btn btn-success">Create</button>
										<button formaction="/admin/updateOrderDetails" type="submit"
											class="btn btn-primary">Update</button>
										
										<button formaction="/admin/reportOrderDetails" type="submit"
											class="btn btn-warning">Reset</button>
									</div>
								</form>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="example1" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th class="column1">ID</th>
												<th class="column2">FullName</th>
												<th class="column3">Email</th>
												<th class="column4">Address</th>
												<th class="column5">ProductName</th>
												<th class="column6">Price</th>
												<th class="column7">Quantity</th>
												<th class="column8">Size</th>
												<th class="column9">CreateDate</th>
												<th class="column10"></th>
											</tr>
										</thead>
										<c:forEach var="item" items="${orderInfoList}">
											<tr>
												<td class="column1">${item.id}</td>
												<td>${item.order.account.fullname}</td>
												<td>${item.order.account.email}</td>
												<td>${item.order.address}</td>
												<td>${item.product.name}</td>
												<td>${item.price}</td>
												<td>${item.quantity}</td>
												<td>${item.product.size}</td>
												<td>${item.order.create_date}</td>
												<td class="column11"><a
													href="/admin/editOderDetails?id=${item.id}"><i
														class="bi bi-pencil text-success me-2"></i></a> <a
													href="/admin/deleteOderDetails?id=${item.id}"><i
														class="bi bi-trash3 text-danger"></i></a></td>

											</tr>

										</c:forEach>
									</table>
								</div>
								<!-- /.card-body -->
							</div>

							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.2.0
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="../../plugins/jszip/jszip.min.js"></script>
	<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
	<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
	<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>
</body>
</html>
