<%-- 
    Document   : Acount
    Created on : Nov 12, 2019, 2:55:08 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .menu{
                float: left;
                                width: 800px;

            }
            body{
                background-color: #2a6496;
            }
            .chia{
                width: 200px;
                margin-top: 20px;

            }

        </style>
        <link rel=”stylesheet” href=”https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css”>

    </head>
    <body>
        <jsp:include page="Header.jsp"/>
        <article>
            <div class="container">

                <div class="menu chia">
                    <form action="Customer">
                        <h4><a style="margin-left: 4px" href="Acount.jsp">Thông tin tài khoản</a></h4>
                        <h4><a style="margin-left: 4px" href="infProduct.jsp">Theo dõi đơn hàng</a></h4>
                        <h4><a><button style="float: left;border: none;background: #ffffff;color: #0066cc;" type="submit" name="action" value="Logout">Đăng Xuất</button></a></h4>
                    </form>
                </div>
                <h1></h1>
                <div class="col-sm-4 menu" style="padding-left: 100px">
                    
                    <div class="signup-form"><!--sign up form-->
                     
                        <div class="menu" >
                         <div class="table-responsive cart_info">
                    <table border="1" class="table table-condensed" >
                        <thead>
                            <tr class="cart_menu">
                           
                                <td class="image"></td>
                                <td class="description">Tên sản phẩm</td>
                                <td class="description">Hãng sản xuất</td>
                                <td class="description">Loại hàng hóa</td>

                                <td class="total">Tổng tiền</td>
                                

                            </tr>
                        </thead>
                        <tbody>
                            <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MyWebsite" user="sa" password="sa" var="con"/>
                            <sql:query dataSource="${con}" var="rs">
                                select Invoice.IdInvoice,Product.ImageProduct,Product.IdProduct,NameProduct,NameProducer,NameProductType,Invoice.Amount*Product.PriceProduct as Total,Invoice.DateOrder from Product join Producer on Product.IdProducer = Producer.IdProducer
                                join TypeProduct on Product.IdProductType = TypeProduct.IdProductType	
                                join Invoice on Product.IdProduct = Invoice.IdProduct
                                join Customer on Invoice.UserCustomer = Customer.UserCustomer
                                where Customer.UserCustomer = ?
                                <sql:param value="${sessionScope.username}"/>
                            </sql:query>





                
                            <c:forEach var="row" items="${rs.rows}">
                                <tr>
                                     <form>
                                      
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
                                    <td class="">
                                        <p class="cart_total_price">${row.Total}</p>
                                    </td>               
                             
                                 
                                       
                                    
                                  </form>

                                </tr>
                            </c:forEach>








                            </tbody>
                    


                    </table>
                </div>
                        </div>


                    </div><!--/sign up form-->

                </div>
            </div>
            <hr>
        </article>

        <jsp:include page="Footer.jsp"/>
    </body>
</html>
