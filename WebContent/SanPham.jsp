<%-- 
    Document   : SanPham
    Created on : Oct 19, 2019, 4:02:39 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản Phẩm</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script>
            function  addSP() {
                                alert("Chúc mừng bạn đã Thêm sản phẩm thành công");

            }
            function  update() {
                alert("Chúc mừng bạn đã Cập nhật sản phẩm thành công");
            }
            function  xoa() {
                confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");

            }
            function validate(){
                document.getElementById("1").value;
                if(document.forms[0].masp == ""){
                    document.getElementById("11").innerHTML= "Không để trống mã sản phẩm";
                    return false;
                }
                if(document.forms[0].tensp == ""){
                    document.getElementById("22").innerHTML= "Không để trống tên sản phẩm";
                    return false;
                }
            }

        </script>
    </head>

    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Eshopper <sup>2</sup></div>
                </a>

                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Quản trị viên Eshopper</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Quản Lý</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                          <a class="collapse-item" href="SanPham.jsp">Sản Phẩm</a>
                            <a class="collapse-item" href="Customer.jsp">Khách Hàng</a>
                            <a class="collapse-item" href="Producer.jsp">Quản lý Hãng sản xuất</a>
                            <a class="collapse-item" href="ProductType.jsp">Quản lý Phân Loại </a>

                        </div>
                    </div>
                </li>
                         <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Quản Lý Hóa Đơn </span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            
                            <a class="collapse-item" href="Invoice.jsp">Theo dõi đơn hàng </a>
                        </div>
                    </div>
            
                </li>


                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="Chart.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Biểu đồ tăng trưởng</span></a>
                </li>



                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <div  style="float: left" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div  class="input-group">
                                <form action="ControllerAdmin">


                                    <input style="float: left;height:45px" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" name="search" aria-describedby="basic-addon2" >
                                    <button style="float: left;height:45px; margin-left: 3px" name="action" value="Search" class="btn btn-primary" type="submit">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>

                                </form>
                            </div>
                        </div>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Alerts Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 12, 2019</div>
                                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 7, 2019</div>
                                            $290.29 has been deposited into your account!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 2, 2019</div>
                                            Spending Alert: We've noticed unusually high spending for your account.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                </div>
                            </li>

                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!-- Counter - Messages -->
                                    <span class="badge badge-danger badge-counter">7</span>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                                            <div class="small text-gray-500">Jae Chun · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                                    <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Sản Phẩm</h1>
                        <p class="mb-4">Trang Sản Phẩm- Bạn có thể tìm kiếm, thêm sửa xóa sản phẩm tại đây</a>.</p>

                        <div class="card shadow col-sm-6">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Thêm Sản Phẩm</h6>
                            </div>
                            <jsp:scriptlet>
                                if (session.getAttribute("list") == null) {
                            </jsp:scriptlet>

                            <form onsubmit="validate()" action="ControllerAdmin">
                                <p><b>Mã sản phẩm :</b> <input id="1" type="text"  class="form-control form-control-user" required="true" pattern=".{,10}" placeholder="Mã sản phẩm" value="" name="masp">  </p>
                             
                                <p><b>Tên sản phẩm :</b><input id="2" type="text" class="form-control form-control-user" required="true" pattern=".{,50}" placeholder="Tên sản phẩm" value="" name="tensp"> </p>
                          
                                <p><b>Ảnh :</b><input  type="text" id="3" class="form-control form-control-user" required="true" pattern=".{,20}" placeholder="Ảnh" value="" name="image"> </p>
                                
                                <p><b>Giá :</b><input type="number" id="4" class="form-control form-control-user" required="true" pattern="[-+]?[0-9]" placeholder="Giá" value="" name="price"> </p>
                               
                                <p><b>Số lượng :</b><input type="number" id="5" class="form-control form-control-user" required="true" pattern="[-+]?[0-9]" placeholder="Số lượng"value="" name="amount"> </p>
                                <p id="55"></p>
                                <p><b>Mô tả:</b><input type="text" id="6" class="form-control form-control-user" required="true" pattern=".{,50}" placeholder="Ghi chú"value="" name="ghichu"> </p>
                            
                                <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MyWebsite" user="sa" password="sa" var="con"/>
                                    <sql:query dataSource="${con}" var="rs">
                                                                           select distinct NameProducer from producer



                                </sql:query>
                                <sql:query dataSource="${con}" var="b">
                                   select distinct  NameProductType from typeproduct
                                </sql:query>

                                <p>

                                    <b>Hãng sản xuất:</b>   <select name="hxs">
                                        <c:forEach var="rs" items="${rs.rows}">
                                            <option value="${rs.NameProducer}">${rs.NameProducer}</option> 
                                        </c:forEach>
                                    </select> 
                                    <b style="margin-left: 100px">Phân Loại:    </b>
                                    <select name="pl">
                                        <c:forEach var="rs" items="${b.rows}">
                                            <option value="${rs.NameProductType}">${rs.NameProductType}</option> 
                                        </c:forEach>
                                    </select>

                                </p>


                                <button style="width: 100px"  type="submit"class="btn btn-primary" name="action"  value="New">Làm mới</button>
                                <button style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary"  id="add" name="action"  value="Insert">Thêm</button>
                                <button style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary"  id="delete" name="action"  value="Delete">Xóa</button>
                                <button style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary"  id="update " name="action"  value="Update">Cập nhật</button>

                            </form>








                            <jsp:scriptlet>
                                }
                            </jsp:scriptlet>
                            <c:set var="sp" value="${sessionScope.list}"/>

                            <div style="float: left">
                                <c:forEach var="a" items="${sp}" end="0">

                                    <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MyWebsite" user="sa" password="sa" var="con"/>
                                    <sql:query dataSource="${con}" var="rs">
                                        select distinct NameProducer from producer
                                     

                                    </sql:query>
                                    <sql:query dataSource="${con}" var="b">
                                        select distinct  NameProductType from typeproduct
                                      
                                    </sql:query>
                                    <form action="ControllerAdmin">
                                        <p><b>Mã sản phẩm :</b> <input type="text"  class="form-control form-control-user" placeholder="Mã sản phẩm" value="${a.idProduct}" name="masp">  </p>
                                        <p><b>Tên sản phẩm :</b><input  type="text" class="form-control form-control-user" placeholder="Tên sản phẩm" value="${a.nameProduct}" name="tensp"> </p>
                                        <p><b>Ảnh :</b><input  type="text" class="form-control form-control-user" placeholder="Ảnh" value="${a.imageProduct}" name="image"> </p>
                                                                        
                                        <p><b>Giá :</b><input type="text" class="form-control form-control-user" placeholder="Giá" value="${a.priceProduct}" name="price"> </p>
                                        <p><b>Số lượng :</b><input type="text" class="form-control form-control-user" placeholder="Số lượng"value="${a.amout}" name="amount"> </p>
                                        <p><b>Mô tả:</b><input type="text" class="form-control form-control-user" placeholder="Ghi chú"value="${a.descriptionProduct}" name="ghichu"> </p>

                                        <p>

                                            <b>Hãng sản xuất:</b>   <select name="hxs">
                                                <c:forEach var="rs" items="${rs.rows}">
                                                    <option value="${rs.NameProducer}">${rs.NameProducer}</option> 
                                                </c:forEach>
                                            </select> 
                                            <b style="margin-left: 100px">Phân Loại:    </b>
                                            <select name="pl">
                                                <c:forEach var="rs" items="${b.rows}">
                                                    <option value="${rs.NameProductType}">${rs.NameProductType}</option> 
                                                </c:forEach>
                                            </select>

                                        </p>


                                        <input style="width: 100px"  type="submit"class="btn btn-primary" name="action"  value="New">
                                        <input style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary" onclick="addSP()" id="add" name="action"  value="Insert">
                                        <input style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary" onclick="xoa()" id="delete" name="action"  value="Delete">
                                        <input style="width: 100px;margin-left: 20px"  type="submit"class="btn btn-primary" onclick="update()" id="update " name="action"  value="Update">
                                    </form>
                                </c:forEach>
                            </div>



                        </div>
                        <div class="card shadow mb-5">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Thông Tin Sản Phẩm</h6>

                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Mã </th>
                                                <th>Tên </th>
                                                <th>Giá</th>
                                                <th>Số Lượng</th>
                                                <th>Ảnh</th>
                                                <th>Ghi chú</th>
                                                <th>Hãng SX</th>
                                                <th style="width: 100px">Phân loại</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ProductDao dao = new ProductDao();
                                                List<Product> list = dao.getList();
                                                for (int i = 0; i < list.size(); i++) {
                                                    out.print("<form action = \"ControllerAdmin\" >");
                                                    out.print("<tr>");
                                                    out.print("<td>" + (i + 1) + "</td>");
                                                    out.print("<td>" + list.get(i).getIdProduct() + "</td>");
                                                    out.print("<td>" + list.get(i).getNameProduct() + "</td>");
                                                    out.print("<td>" + list.get(i).getPriceProduct() + "</td>");
                                                    out.print("<td>" + list.get(i).getAmout() + "</td>");
                                                    out.print("<td>" + list.get(i).getImageProduct() + "</td>");
                                                    out.print("<td>" + list.get(i).getDescriptionProduct() + "</td>");
                                                    out.print("<td>" + list.get(i).getProducer().getNameProducer() + "</td>");
                                                    out.print("<td>" + list.get(i).getTypeProduct().getNameProductType() + "</td>");

                                                    out.print("</tr>");
                                                    out.print("</form>");

                                                }

                                            %>


                                        </tbody >
                                    </table>
                                </div>
                            </div >
                        </div>

                        <!-- DataTales Example -->


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2019</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>
</html>
