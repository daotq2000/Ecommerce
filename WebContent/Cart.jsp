<%-- 
    Document   : Cart
    Created on : Nov 8, 2019, 9:04:02 AM
    Author     : Administrator
--%>

<%@page import="Cart.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script>
	function TinhTong() {
		var key = document.getElementById("key").value;
		//               if(key==1){
		var price = document.getElementById("txtgia1").value;
		var sl = document.getElementById("sl1").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show1").innerHTML = "Tổng Tiền: $" + tong;
		//               }else  if(key==2){
		var price = document.getElementById("txtgia2").value;
		var sl = document.getElementById("sl2").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show2").innerHTML = "Tổng Tiền: $" + tong;
		//               }else  if(key==3){
		var price = document.getElementById("txtgia3").value;
		var sl = document.getElementById("sl3").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show3").innerHTML = "Tổng Tiền: $" + tong;
		//               }
		//               else  if(key==4){
		var price = document.getElementById("txtgia4").value;
		var sl = document.getElementById("sl4").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show4").innerHTML = "Tổng Tiền: $" + tong;
		//               }
		//               else  if(key==5){
		var price = document.getElementById("txtgia5").value;
		var sl = document.getElementById("sl5").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show5").innerHTML = "Tổng Tiền: $" + tong;
		//               }
		//               else  if(key==1){
		var price = document.getElementById("txtgia6").value;
		var sl = document.getElementById("sl6").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show6").innerHTML = "Tổng Tiền: $" + tong;
		//               }
		//               else  if(key==7){
		var price = document.getElementById("txtgia7").value;
		var sl = document.getElementById("sl7").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show7").innerHTML = "Tổng Tiền: $" + tong;
		//               }
		//               else  if(key==9){
		var price = document.getElementById("txtgia9").value;
		var sl = document.getElementById("sl9").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show9").innerHTML = "Tổng Tiền: $" + tong;
		//               }else  if(key==10){
		var price = document.getElementById("txtgia10").value;
		var sl = document.getElementById("sl10").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show10").innerHTML = "Tổng Tiền: $" + tong;
		//               }else  if(key==11){
		var price = document.getElementById("txtgia11").value;
		var sl = document.getElementById("sl11").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show11").innerHTML = "Tổng Tiền: $" + tong;
		//               }else  if(key==12){
		var price = document.getElementById("txtgia12").value;
		var sl = document.getElementById("sl12").value;
		tong = Number(price) * Number(sl);
		document.getElementById("show12").innerHTML = "Tổng Tiền: $" + tong;
		//               }
	}
</script>
</head>

<body onload="TinhTong()">

	<jsp:include page="Header.jsp" />

	<c:set var="shop" value="${sessionScope.SHOP}" />
	<c:if test="${empty shop}">
		<div style="text-align: center">
			<h4>
				<a>Xin hãy quay về Trang Chủ để chọn sản phẩm</a>
			</h4>
			<h2>
				<a href="index.jsp">Home</a>
			</h2>
		</div>

	</c:if>
	<c:if test="${not empty shop}">

		<h2 class="title text-center">Giỏ Hàng</h2>
		<section id="cart_items">
			<div class="container">

				<div class="table-responsive cart_info">
					<table id="cart" class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Ảnh</td>
								<td class="description">Tên sản phẩm</td>
								<td class="price">Giá</td>
								<td class="quantity">Số lượng</td>

								<td class="total">Chọn</td>
								<td class="total" style="width: 340px">Hành động</td>

							</tr>
						</thead>
						<tbody>


							<c:set var="count" value="0" />




							<c:forEach var="rows" items="${shop}">

								<c:set var="count" value="${count+1}" />
								<tr>
									<form action="Customer">
										<input type="hidden" id="key" value="${count}">
										<td class="cart_product"><a href=""><img
												src="images/cart/${rows.value.sanPham.imageProduct}" alt=""></a>

										</td>
										<td class="cart_price">
											<h4>
												<a href="">${rows.value.sanPham.nameProduct}</a>
											</h4>
											<p>${rows.value.sanPham.idProduct}</p>
										</td>
										<td class="cart_price">
											<h4>
												<label id="price">${rows.value.sanPham.priceProduct}</label>
											</h4>
										</td>

										<td class="cart_quantity">
											<div class="cart_quantity_button">

												<input readonly="true" class="cart_quantity_input"
													type="text" name="quantity" value="${rows.value.soluong}"
													autocomplete="off" size="2">

											</div>
										</td>






										<td colspan="2" class="cart_delete cart_quantity_button"><input
											style="height: 20px; width: 20px" type="checkbox" name="rmv"
											value="${rows.value.sanPham.idProduct}"></td>
										<c:url var="add" value="Customer">
											<c:param name="action" value="AddMore" />
										</c:url>
										<input type="hidden" name="txtMasp"
											value="${rows.value.sanPham.idProduct}"> <input
											type="hidden" id="txtgia${count}" name="txtgia"
											value="${rows.value.sanPham.priceProduct}">
										<td colspan="2"><a class="btn btn-fefault cart"
											href="${add}">Mua thêm</a> 
											<button
											style="padding-left: 2px; background-color: #CE3C2D"
											class="btn btn-fefault cart" type="submit" value="Remove"
											name="action"> Xóa</button>
											<button data-toggle="modal"
												data-target="#modalAbandonedCart${count}"
												tabindex="${count}"
												style="float: right; background: #169b6b; color: white"
												type="button" class="btn btn-fefault cart" value="Pay">
												<i class="fa fa-shopping-cart"></i> Xác Nhận
											</button></td>
										<div class="modal fade right" id="modalAbandonedCart${count}"
											tabindex="${count}" role="dialog"
											aria-labelledby="myModalLabel" aria-hidden="true"
											data-backdrop="false">
											<div
												class="modal-dialog modal-side modal-bottom-right modal-notify modal-info"
												role="document">
												<!--Content-->
												<div class="modal-content">
													<!--Header-->
													<div class="modal-header">
														<p style="color: orange" class="  heading">
															<i class="fa fa-shopping-cart"></i> Thanh Toán
														</p>

														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true" class="white-text">&times;</span>
														</button>
													</div>

													<!--Body-->
													<div class="modal-body">

														<div class="row">
															<div style="float: left" class="col-3">
																<p></p>
																<p class="text-center">
																	<img
																		src="images/cart/${rows.value.sanPham.imageProduct}"></i>
																</p>
															</div>



															<h5>
																<a href="#">Mã Sản Phẩm
																	:${rows.value.sanPham.idProduct}</a>
															</h5>
															<h5>
																<a href="#">Tên sản phẩm:
																	${rows.value.sanPham.nameProduct}</a>
															</h5>
															<p>
															<h5>
																<a>Số lượng:<input onchange="TinhTong()"
																	id="sl${count}" name="txtsl" style="width: 35px"
																	type="number" value="${rows.value.soluong}"></a>
															</h5>
															</p>
															<h5>
																<a>Giá : $${rows.value.sanPham.priceProduct}</a>
															</h5>
															<p>
															<h5>
																<a style="margin-top: 20px;" id="show${count}">$</a>
															</h5>
															</p>


														</div>
													</div>


													<!--Footer-->
													<div class="modal-footer justify-content-center">
														<a type=""><button class="btn btn-info" type="submit"
																name="action" value="Pay">
																<i class="fa fa-shopping-cart"></i>Thanh Toán
															</button>
															</i></a> <a style="background: #CE3C2D; color: white"
															type="button" class="btn btn-outline-info waves-effect"
															data-dismiss="modal">Cancel</a>
													</div>
												</div>
												<!--/.Content-->
											</div>

										</div>
								</tr>

								<!-- Modal: modalAbandonedCart-->
							</c:forEach>
						</tbody>


					</table>



				</div>

			</div>

		</section>
		<!--/#cart_items-->







	</c:if>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	<jsp:include page="Footer.jsp" />

</body>
</html>
