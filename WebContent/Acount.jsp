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
            }
            body{
                background-color: #2a6496;
            }
            .chia{
                width: 200px;
                margin-top: 20px;

            }

        </style>

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
                    <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MyWebsite" user="sa" password="sa" var="con"/>
                    <sql:query dataSource="${con}" var="rs">
                        select usercustomer,passwordcustomer,namecustomer,email,phonenumber,Addresscustomer from customer 
                        where  usercustomer=?
                        <sql:param value="${sessionScope.username}"/>


                    </sql:query>
                    <div class="signup-form"><!--sign up form-->
                        <h4><a>Thông tin cá nhân!</a></h4>
                        <div>
                                                    <img   src="img/users-vector-icon-png_260862.jpg" width="80" height="80" align="left">

                        </div>

                        <div class="menu" >
                            <c:forEach var="row" items="${rs.rows}">
                                <form action="ControllerAdmin">
                                    <p ><b>Họ và Tên :</b>  <input type="text" class="form-control form-control-user" id="exampleFirstName" size="30" placeholder="Tên KH" value="${row.nameCustomer}" name="tenkh"> </p>
                                    <p><b>Email :</b>  <input type="email" class="form-control form-control-user" id="exampleFirstName" placeholder="Email" value="${row.email}" name="email"> </p>
                                    <p><b>Số Điện Thoại :</b> <input type="text" class="form-control form-control-user" id="exampleFirstName" value="${row.phoneNumber}" placeholder="Sđt" name="sdt">
                                    </p>
                                    <p><b>Tài khoản :</b> <input type="text" class="form-control form-control-user" id="exampleFirstName" value="${row.userCustomer}" placeholder="Username" name="username"> </p>
                                    <p><b>Mật Khẩu :</b>  <input type="password" class="form-control form-control-user" id="exampleFirstName" value="${row.passwordCustomer}" placeholder="Password" name="password"> </p>

                                    <p><b>Địa chỉ :</b>   <textarea type="text" class="form-control form-control-user" id="exampleFirstName" value="${row.addressCustomer}" placeholder="Địa chỉ" name="diachi">${row.addressCustomer}</textarea> </p>
                                    <button  type="submit" class="btn btn-primary" onclick="update()" name="action"  value="UpdateAcount">
                                        Cập Nhật Thông Tin
                                    </button>
                                </form>


                            </c:forEach>


                        </div>


                    </div><!--/sign up form-->

                </div>
            </div>
            <hr>
        </article>

        <jsp:include page="Footer.jsp"/>
    </body>
</html>
