<%-- 
    Document   : index
    Created on : Nov 7, 2019, 10:37:10 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <c:set var="list" value="${sessionScope.LIST}"/>
    </header><!--/header-->
    <section id="slider"><!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h3>OPPO sành điệu cùng Sơn Tùng-MTP</h3>


                                </div>
                                <div class="col-sm-6">
                                    <img src="images/home/st.jpg" height="100px" class="girl img-responsive" alt="" />
                                    <!-- <img arc="images/home/pricing.png"  class="pricing" alt="" /> -->
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h3>LEE MIN HO thật đẹp trai cùng Vivo-Smart </h3>


                                </div>
                                <div class="col-sm-6">
                                    <img  src="images/home/nn.jpg" class="girl img-responsive" alt="" />

                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h3>Tan chảy cùng Tóc Tiên với Oppo</h3>


                                </div>
                                <div class="col-sm-6">
                                    <img src="images/home/toctien.jpg" class="girl img-responsive" alt="" />

                                </div>
                            </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section> 

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Category</h2>
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
                            <h2>Brands</h2>
                            <div class="brands-name">
                                <form action="Customer">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="#"> <span class="pull-right">(50)</span><input style="background-color: white;border: none" type="submit" name="action" value="IPHONE"> </a></li>
                                        <li><a href="#"> <span class="pull-right">(56)</span><input style="background-color: white;border: none" type="submit" name="action" value="XIAOMI"></a></li>
                                        <li><a href="#"> <span class="pull-right">(27)</span><input style="background-color: white;border: none" type="submit" name="action" value="SAMSUNG"></a></li>
                                        <li><a href="#"> <span class="pull-right">(32)</span><input style="background-color: white;border: none" type="submit" name="action" value="VIVO BOOK"></a></li>
                                        <li><a href="#"> <span class="pull-right">(5)</span><input style="background-color: white;border: none" type="submit" name="action" value="HUAWEI"></a></li>
                                        <li><a  href="#"> <span class="pull-right">(9)</span><input style="background-color: white;border: none" type="submit" name="action" value="BLACKBERY"></a></li>

                                    </ul>
                                </form>
                                <div class="price-range"><!--price-range-->
                                    <h2>Price Range</h2>
                                    <form action="Customer">
                                        <div class="well text-center">

                                            <input name="Search" type="text" placeholder="Nhập tên sản phẩm" >

                                            <p> <b  class="pull-left">$ 0</b> <b class="pull-right">$ 600</b></p>  
                                            <p><input type="submit"  class="btn btn-primary" name="action"  value="Search"></p> 
                                        </div>
                                    </form>
                                </div><!--/price-range-->

                                <div class="shipping text-center"><!--shipping-->
                                    <img src="images/home/chipu_2.jpeg" alt="" />
                                </div><!--/shipping-->
                            </div>
                        </div >
                    </div>
                </div>
                <c:if test="${not empty list}">
             
<div class="col-sm-9 padding-right">
                                <div class="features_items"><!--features_items-->
                                  
                                    <h2 class="title text-center">Features Items</h2>
                                             <c:forEach var="rows" items="${list}">
                                                   <form action="Customer">
                                    <div class="col-sm-4">
                                       
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                    <div class="productinfo text-center">
                                                  
                                                        <img src="images/home/${rows.imageProduct}" alt="" />
                                                        <h2>$${rows.priceProduct}</h2>
                                            <p>${rows.nameProduct}</p>
                                            <p>${rows.descriptionProduct}</p>
                                            <a href="#" class="btn btn-default add-to-cart"><buton type="submit" class="fa fa-shopping-cart " value="View Detail" name="action"> View Detail</buton></a>
                                                    </div>
                                                    <div class="product-overlay">
                                                        <div class="overlay-content">
                                                            <h2>$${rows.priceProduct}</h2>
                                                <p>${rows.nameProduct}</p>
                                                                                            <p>${rows.descriptionProduct}</p>
                                                                                            <a href="#" class="btn btn-default add-to-cart"><buton type="submit" class="fa fa-shopping-cart" value="View Detail" name="action">View Detail</buton></a>
                                                        </div>
                                                    </div>
                                            </div>
                                            <input type="hidden" name="txtMasp" value="${rows.idProduct}">
                            <input type="hidden" name="txtTensp" value="${rows.nameProduct}">"
                            <input type="hidden" name="txtanh" value="${rows.imageProduct}">
                            <input type="hidden" name="txtsl" value="${rows.amout}">
                            <input type="hidden" name="txtGhichu" value="${rows.descriptionProduct}">
                            <input type="hidden" name="txtgia" value="${rows.priceProduct}">
                            <input type="hidden" name="txthxs" value="${rows.producer}">
                            <input type="hidden" name="txtloaihh" value="${rows.typeProduct}">
                                        </div>
                                     
                                    </div>
                                             </form>
                                           </c:forEach>
                                </div>
</div>
             
                </c:if>
                
            </div><!--/brands_products-->
    </section>

    <jsp:include page="Footer.jsp"/>
</body>
</html>
