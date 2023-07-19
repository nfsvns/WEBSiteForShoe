<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
							<h1>Quản Lý Hình Ảnh</h1>
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
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Cập nhật thông tin</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Mã đơn hàng</label> <input
												type="email" class="form-control" id="exampleInputEmail1"
												placeholder="Mã đơn">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Tên sản phẩm</label> <input
												type="password" class="form-control"
												id="exampleInputPassword1" placeholder="Tên sản phẩm">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Giá</label> <input
												type="email" class="form-control" id="exampleInputEmail1"
												placeholder="Giá">
										</div>
										<div class="form-group">
											<label>Tên người mua</label> <input class="form-control">
										</div>
										<div class="form-group">
											<label>Giá</label> <input class="form-control">
										</div>
										<div class="form-group">
											<label>Địa chỉ</label> <input class="form-control">
										</div>
										<div class="form-group">
											<label>Số điên thoại</label> <input class="form-control">
										</div>
									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-success">Thêm</button>
										<button type="submit" class="btn btn-primary">Sửa</button>
										<button type="submit" class="btn btn-danger">Xóa</button>
									</div>
								</form>
							</div>
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Quản lý tài khoản</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="example1" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>ProductID</th>
												<th>Image1</th>
												<th>Image2</th>
												<th>Image3</th>
												<th>Image4</th>
												<th>Image5</th>
												<th>Image6</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${images}">
												<tr>
													<td>${item.id}</td>
													<td>${item.product.id}</td>
													<td>${item.image1}</td>
													<td>${item.image2}</td>
													<td>${item.image3}</td>
													<td>${item.image4}</td>
													<td>${item.image5}</td>
													<td>${item.image6}</td>


												</tr>

											</c:forEach>
										</tbody>
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
