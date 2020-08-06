<%-- 
    Document   : Cart_Detail
    Created on : Nov 6, 2019, 10:36:48 PM
    Author     : Administrator
--%>


<%@page import="Model.Product"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>


        <jsp:scriptlet>
            if (session.getAttribute("SP") == null) {
        </jsp:scriptlet>
        <div class="container text-center">
            <div class="logo-404">
                <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
            </div>
            <div class="content-404">
                <img src="images/404/404.png" class="img-responsive" alt="" />
                <h1><b>OPPS!</b> We Couldn’t Find this Page</h1>
                <p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished.</p>
                <h2><a href="index.html">Bring me back Home</a></h2>
            </div>
        </div>
        <jsp:scriptlet>
        } else {
        </jsp:scriptlet>

        <c:set var="sp" value="${sessionScope.SP}"/>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Danh mục</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                MÁY TÍNH BẢNG
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="sportswear" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Nike </a></li>
                                                <li><a href="#">Under Armour </a></li>
                                                <li><a href="#">Adidas </a></li>
                                                <li><a href="#">Puma</a></li>
                                                <li><a href="#">ASICS </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                LAPTOP
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="mens" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Fendi</a></li>
                                                <li><a href="#">Guess</a></li>
                                                <li><a href="#">Valentino</a></li>
                                                <li><a href="#">Dior</a></li>
                                                <li><a href="#">Versace</a></li>
                                                <li><a href="#">Armani</a></li>
                                                <li><a href="#">Prada</a></li>
                                                <li><a href="#">Dolce and Gabbana</a></li>
                                                <li><a href="#">Chanel</a></li>
                                                <li><a href="#">Gucci</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                ĐIỆN THOẠI
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="womens" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="#">Fendi</a></li>
                                                <li><a href="#">Guess</a></li>
                                                <li><a href="#">Valentino</a></li>
                                                <li><a href="#">Dior</a></li>
                                                <li><a href="#">Versace</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="#">VIVO</a></h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="#">PHỤ KIỆN ĐIỆN THOẠI</a></h4>
                                    </div>
                                </div>

                            </div>

                            <div class="brands_products"><!--brands_products-->
                                <h2>Thương hiệu</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="#"> <span class="pull-right">(50)</span>IPHONE</a></li>
                                        <li><a href="#"> <span class="pull-right">(56)</span>XIAOMI</a></li>
                                        <li><a href="#"> <span class="pull-right">(27)</span>SAMSUNG</a></li>
                                        <li><a href="#"> <span class="pull-right">(32)</span>VIVO BOOK</a></li>
                                        <li><a href="#"> <span class="pull-right">(5)</span>HUAWEI</a></li>
                                        <li><a  href="#"> <span class="pull-right">(9)</span>BLACKBERY</a></li>

                                    </ul>
                                </div>
                            </div><!--/brands_products-->


                        </div>
                    </div >

                    <c:forEach var="rows" items="${SP}">
                        <div class="col-sm-9 padding-right">
                            <div class="product-details"><!--product-details-->
                                <div class="col-sm-5">
                                    <div class="view-product">
                                        <img src="images/home/${rows.value.sanPham.imageProduct}" alt="" />
                                        <h3>Phóng to</h3>
                                    </div>
                                    <div id="similar-product" class="carousel slide" data-ride="carousel">

                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="index.jsp"><img src="images/product-details/acer1.png" alt=""/></a>
                                                <a href="index.jsp"> <img src="images/product-details/acer2.png" alt=""/></a>

                                                <a href="index.jsp">  <img src="images/product-details/dell2.png" alt=""/></a>
                                               



                                            </div>
                                            <div class="item">
                                                <a href="index.jsp">  <img src="images/product-details/ipad3.png" alt=""/></a>

                                                <a href="index.jsp"><img src="images/product-details/ipad4.jpg" alt=""/></a>
                                                <a href="index.jsp"><img src="images/product-details/ipad5.jpg" alt=""/></a>



                                            </div>
                                            <div class="item">
                                                <a href="index.jsp"><img src="images/product-details/iphone(10)6.jpg" alt=""/></a>

                                                <a href="index.jsp"><img src="images/product-details/iphone(11)3.jpg" alt=""/></a>
                                                <a href="index.jsp"><img src="images/product-details/iphone(8)1.png" alt=""/></a>

                                       



                                            </div>

                                        </div>

                                        <!-- Controls -->
                                        <a class="left item-control" href="#similar-product" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="right item-control" href="#similar-product" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <form action="Customer">
                                        <div class="product-information"><!--/product-information-->
                                            <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                            <h2>${rows.value.sanPham.descriptionProduct}</h2>
                                            <p>Mã sản phẩm: ${rows.value.sanPham.idProduct}</p>
                                            <img src="images/product-details/rating.png" alt="" />
                                            <span>
                                                <span>Giá: <fmt:formatNumber value = "${rows.value.sanPham.priceProduct}"  type = "number"/>  VNĐ</span>
                                                <label>Số lượng:</label>
                                                <input type="text" value="${rows.value.sanPham.amout}" />
                                                <button type="submit" class="btn btn-fefault cart" name="action"  value="Add to Cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                   Thêm vào giỏ hàng       
                                                </button>
                                            </span>


                                            <p><b>Hãng sản xuất :<c:out value="${sessionScope.hxs}"/>   </b> </p>
                                            <p><b>Phân loại :</b> <c:out value="${sessionScope.loaihh}"/>   </p>
                                            <p><b>Cửa hàng:</b> E-SHOPPER</p>
                                            <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                        </div><!--/product-information-->
                                        <input type="hidden" name="txtMasp" value="${rows.value.sanPham.idProduct}">
                                        <input type="hidden" name="txtTensp" value="${rows.value.sanPham.nameProduct}">"
                                        <input type="hidden" name="txtanh" value="${rows.value.sanPham.imageProduct}">
                                        <input type="hidden" name="txtsl" value="${rows.value.sanPham.amout}">
                                        <input type="hidden" name="txtGhichu" value="${rows.value.sanPham.descriptionProduct}">
                                        <input type="hidden" name="txtgia" value="${rows.value.sanPham.priceProduct}">
                                        <input type="hidden" name="txthxs" value="${sessionScope.hxs}">
                                        <input type="hidden" name="txtloaihh" value="${sessionScope.loaihh}">
                                    </form>
                                </div>
                            </div><!--/product-details-->



                        </div>


                    </div>

                </div>


            </section>

        </c:forEach>
        <%
            session.setAttribute("SP", null);
        %>
        <jsp:scriptlet>
            }
        </jsp:scriptlet>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
