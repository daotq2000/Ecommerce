<%-- 
    Document   : Login
    Created on : Nov 8, 2019, 10:08:06 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <script type="text/javascript">
	function checkPassword(){
		var p1 = document.getElementById("p1").value;
		var p2 = document.getElementById("p2").value;
		if(p1 != p2){
			document.getElementById("err").innerHTML = "Mật khẩu không đúng vui lòng nhập lại";
			return false;
		}
		
	}
    </script>
        <jsp:include page="Header.jsp"/>
       <c:set var="u" value="${sessionScope.tk}"/>
        <title><c:out value="${u}"/></title>
       

            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h2>Đăng nhập</h2>
                         <form action="Customer">
                             <input type="text" required="" pattern=".{,20}" placeholder="Tài khoản" name="username"/>
                                <input type="password" required="" pattern=".{,20}" placeholder="Mật khẩu" name="password"/>
                                <span>
                                    <input type="checkbox" class="checkbox"> 
                                    Nhớ đăng nhập
                                </span>
                                
                                <button style="background-color: orangered; color: white"  type="submit" value="Login"  name="action">Đăng nhập</button>
                                <%
                                session.setAttribute("user", request.getParameter("username"));
                                 session.setAttribute("pass", request.getParameter("password"));
                                %>
                         </form>
  
                        </div><!--/login form-->
                    </div>
                    <div class="col-sm-1">
                        <h2 class="or">OR</h2>
                    </div>
                    <div class="col-sm-4">
                        <div class="signup-form"><!--sign up form-->
                            <h2>Đăng ký	</h2>
                         

 <form onsubmit="return checkPassword()" action="Customer">
                                <input type="text" required="" pattern=".{,50}" placeholder="Họ và Tên" name="name"/>
                                <input type="email" required="" pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$" placeholder="Email " name="email"/>
                                <input type="number"  required="" pattern="[-+]?[0-9]" placeholder="Số điện thoại" name="phone" />
                                <input type="text"  type="text" required="" pattern=".{,200}" placeholder="Địa chỉ" name="address" />
                                <input type="text" required="" pattern=".{,20}" placeholder="Tên tài khoản" name="username1"/>
                                <input type="password" id="p1" required="" pattern=".{,20}" placeholder="Mật khẩu" name="password1"/>
                                <input type="password" id="p2"required="" pattern=".{,20}" placeholder="Xác nhận mật khẩu" />
                                <p id="err" style="color: red;font-size: medium;"></p>


                                <button style="background-color: orangered; color: white" name="action" value="Signup" type="submit" class="btn btn-default">Đăng ký</button>

                         
                            </form>
                        </div><!--/sign up form-->
                    </div>
                </div>
            </div>
   
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
