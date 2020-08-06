<%-- 
    Document   : Errorpage
    Created on : Oct 19, 2019, 4:25:49 PM
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
        <jsp:include page="Header.jsp"/>
       <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
              <div class="error mx-auto" data-text="404"><h1>404</h1></div>
              <p class="lead text-gray-800 mb-5"><h2>Đăng nhập không thành công</h2></p>
          <p class="text-gray-500 mb-0"><h3>Tài Khoản và Mật khẩu của bạn nhập không đúng</h3></p>
            <a href="index.jsp">&larr; Back to Home</a>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->

      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
 <jsp:include page="Footer.jsp"/>
    </body>
</html>
