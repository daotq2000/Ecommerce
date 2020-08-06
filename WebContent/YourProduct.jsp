<%-- 
    Document   : YourProduct
    Created on : Nov 8, 2019, 10:00:32 AM
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="Cart.CartBean"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel=”stylesheet” href=”https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css”>


    </head>
    <body>
        <jsp:include page="Header.jsp"/>

        <h2 class="title text-center">Sản phẩm của bạn</h2>
        <section id="cart_items">
            <div class="container">

                <div class="table-responsive cart_info">
                    <table class="table table-condensed" >
                        <thead>
                            <tr class="cart_menu">
                           
                                <td class="image"></td>
                                <td class="description">Tên sản phẩm</td>
                                <td class="description">Hãng sản xuất</td>
                                <td class="description">Loại hàng hóa</td>
                                <td class="total">Số Lượng</td>
                                <td class="total">Tổng tiền</td>
                                <td  class="total">Hành Động</td>
                                

                            </tr>
                        </thead>
                        <tbody>
                            <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MyWebsite" user="sa" password="sa" var="con"/>
                            <sql:query dataSource="${con}" var="rs">
                                select Invoice.IdInvoice,Product.ImageProduct,Product.IdProduct,NameProduct,NameProducer,NameProductType,Invoice.Amount,Invoice.Amount*Product.PriceProduct as Total,Invoice.DateOrder from Product join Producer on Product.IdProducer = Producer.IdProducer
                                join TypeProduct on Product.IdProductType = TypeProduct.IdProductType	
                                join Invoice on Product.IdProduct = Invoice.IdProduct
                                join Customer on Invoice.UserCustomer = Customer.UserCustomer
                                where Customer.UserCustomer = ?
                                <sql:param value="${sessionScope.username}"/>
                            </sql:query>





                
                            <c:forEach var="row" items="${rs.rows}">
                                <tr>
                            <form action="Customer">
                                      
                                    <td class="cart_product">

                                        <a href=""><img src="images/cart/${row.ImageProduct}" alt=""></a>
                                        
                                    </td>

                                    <td class="cart_description">
                                        <h4><a href="">${row.NameProduct}</a></h4>
                                        <p>Ngày đặt hàng: ${row.DateOrder}</p>

                                    </td>
                                    <td style="font-size: large">
                                        <p>${row.NameProducer}</p>
                                    </td>

                                    <td class="">
                                        <p style="font-size: large">${row.NameProductType}</p>
                                    </td>
                                    <td  style="padding-bottom: 25px;"class="total"><h3><a>${row.Amount}</a></h3></td>
                                    <td class="">
                                        <p class="cart_total_price">${row.Total}</p>
                                    </td>               
                             
                                    <input type="hidden" name="masp" value="${row.IdInvoice}">
                                    <td>
                                        <button style="background-color: #CE3C2D"  type="submit" name="action" class="btn btn-fefault cart" value="rmvInvoice">
                                    <i class="glyphicon glyphicon-remove"></i>
                                   Hủy Đơn
                                </button>
                                    </td>
                                    </td>
                                  </form>

                                </tr>
                            </c:forEach>








                            </tbody>
                    


                    </table>
                </div>
            </div>
        </section>
                            


                    <jsp:include page="Footer.jsp"/>

                    </body>
                    </html>




