<%-- 
    Document   : index
    Created on : Nov 7, 2019, 10:37:10 AM
    Author     : Administrator
--%>

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
      <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 clearfix">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                            <div class="btn-group pull-right clearfix">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        USA
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canada</a></li>
                                        <li><a href="">UK</a></li>
                                    </ul>
                                </div>

                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        DOLLAR
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canadian Dollar</a></li>
                                        <li><a href="">Pound</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 clearfix">
                            <div class="shop-menu clearfix pull-right">
                                <ul class="nav navbar-nav">
                                
                                    <li><a href="Cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a id="a" href="Acount.jsp"><i  class="fa fa-lock"></i> My Acount</a></li>
                              
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp" class="active">Home</a></li>
                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="shop.html">Products</a></li>
                                            <li><a href="product-details.html">Product Details</a></li> 
                                            <li><a href="checkout.html">Checkout</a></li> 
                                            <li><a href="Cart.jsp">Cart</a></li> 
                                            <li><a href="login.jsp">Login</a></li> 
                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="blog.html">Blog List</a></li>
                                            <li><a href="blog-single.html">Blog Single</a></li>
                                        </ul>
                                    </li> 
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="contact-us.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <input type="text" placeholder="Search"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
       
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
                                    <% ProductDao dao = new ProductDao();
                                    Product sp = new Product();
                               out.print("<div class=\"features_items\"><!--features_items-->\n" +
"					<h2 class=\"title text-center\">Sản Phẩm Hot Nhất 2019</h2>");
            
                              int index = 0;
            				List<Product> list = dao.getList();
                                        index++;
            				for(int i = 0; i<9;i++){
                                                     out.print("<form action = \"Customer\">");
            					
            					out.print(
            							 " <div style=\"float: left\"   class=\"col-sm-4\">"+
                                          "<div class=\"product-image-wrapper\">"+
                                              "<div class=\"single-products\">"+
                                                      "<div class=\"productinfo text-center\">"+
                                                        " <img src=\'images/home/"+list.get(i).getImageProduct()+" '/>"+
                                                          "<h2> $"+list.get(i).getPriceProduct()+"</h2>"+
                                                         " <p>"+list.get(i).getNameProduct()+"</p>"+
                                                         " <a href=\"#\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>View Detail</a>"+
                                                     " </div>"+
                                                      "<div class=\"product-overlay\">"+
                                                          "<div class=\"overlay-content\">"+
                                                        		  "<h2> $"+list.get(i).getPriceProduct()+"</h2>"+
                                                                  " <p>"+list.get(i).getNameProduct()+"</p>"+
                                                             " <a href=\"#\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i><input style=\"border: none\" type=\"submit\"  class=\"fa fa-shopping-cart\" value=\"View Detail\" name=\"action\"></a>"+
                                                         " </div>"+
                                                      "</div>"+
                                              "</div>"+
                                              "<div class=\"choose\">"+
                                                  "<ul class=\"nav nav-pills nav-justified\">"+
                                            
                                                 " </ul>"+
                                              "</div> "+
                                              "</div> "+
                                              "</div> "
                                                        +"<input type=\"hidden\" name=\"txtMasp\" value='"+list.get(i).getIdProduct()+"'>"+
                                               "<input type=\"hidden\" name=\"txtTensp\" value='"+list.get(i).getNameProduct()+"'>"+
                                               "<input type=\"hidden\" name=\"txtanh\" value='"+list.get(i).getImageProduct()+"'>"+
                                               "<input type=\"hidden\" name=\"txtsl\" value='"+list.get(i).getAmout()+"'>"
                                              +"<input type=\"hidden\" name=\"txtGhichu\" value='"+list.get(i).getDescriptionProduct()+"'>"
                                                          +"<input type=\"hidden\" name=\"txtgia\" value='"+list.get(i).getPriceProduct()+"'>"
                                                          +"<input type=\"hidden\" name=\"txthxs\" value='"+list.get(i).getProducer().getNameProducer()+"'>"
                                                           +"<input type=\"hidden\" name=\"txtloaihh\" value='"+list.get(i).getTypeProduct().getNameProductType()+"'>"
                                           
                                                );
                                             
                                              
                                                      
                                       out.print("</form>");                                        
            				}
                                        
                                          
                                        
            				%>
                                        </div >
                                    </div><!--/brands_products-->
                                    </section>
        
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
