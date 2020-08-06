/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Cart.CartBean;
import Cart.SanphamDTO;
import DAO.CustomerDao;
import DAO.InvoiceDao;
import DAO.ProductDao;
import Model.Customer;
import Model.Invoice;
import Model.Producer;
import Model.Product;
import Model.TypeProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class ControllerCustomer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            ProductDao dao = new ProductDao();
            String action = request.getParameter("action");
            if (action.equals("View Detail")) {

                CartBean shop = (CartBean) session.getAttribute("SP");
                if (shop == null) {
                    shop = new CartBean();
                }
                String masp = request.getParameter("txtMasp");
                String tensp = request.getParameter("txtTensp");
                String anh = request.getParameter("txtanh");
                String sl = request.getParameter("txtsl");
                String ghichu = request.getParameter("txtGhichu");
                String gia = request.getParameter("txtgia");
                String hxs = request.getParameter("txthxs");
                String loaihh = request.getParameter("txtloaihh");
                Integer price = Integer.parseInt(gia);
                Producer producer = dao.ExcuteProducer(hxs);
                Integer quanlity = Integer.parseInt(sl);
                TypeProduct typeProduct = dao.ExcuteTypeProduct(loaihh);
                Product product = new Product(masp, producer, typeProduct, tensp, price, quanlity, anh, ghichu);
                SanphamDTO p = new SanphamDTO(product);
                shop.ThemSanPham(p);

                session.setAttribute("SP", shop);
                session.setAttribute("hxs", hxs);
                session.setAttribute("loaihh", loaihh);
                RequestDispatcher rd = request.getRequestDispatcher("Cart_Detail.jsp");
                rd.forward(request, response);

            } else if (action.equals("Search")) {
                String search = request.getParameter("Search");
                List<Product> list = dao.FindbyName(search);
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("IPHONE")) {

                List<Product> list = dao.FindbyName("IPHONE");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("XIAOMI")) {

                List<Product> list = dao.FindbyName("XIAOMI");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("SAMSUNG")) {

                List<Product> list = dao.FindbyName("SAM SUNG");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("VIVO BOOK")) {

                List<Product> list = dao.FindbyName("VIVO BOOK");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("HUAWEI")) {

                List<Product> list = dao.FindbyName("Heawei");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("BLACKBERY")) {

                List<Product> list = dao.FindbyName("Black");
                session.setAttribute("LIST", list);
                RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
                rd.forward(request, response);
            } else if (action.equals("Add to Cart")) {
                try {
                    String username1 = (String) session.getAttribute("username");
                    String password1 = (String) session.getAttribute("password");
//                    if (dao.checklogin(username1, password1)) {

                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop == null) {
                        shop = new CartBean();

                    }

                    String masp = request.getParameter("txtMasp");
                    String tensp = request.getParameter("txtTensp");
                    String anh = request.getParameter("txtanh");
                    String sl = request.getParameter("txtsl");
                    String ghichu = request.getParameter("txtGhichu");
                    String gia = request.getParameter("txtgia");
                    String hxs = request.getParameter("txthxs");
                    String loaihh = request.getParameter("txtloaihh");
                    Integer price = Integer.parseInt(gia);
                    Producer producer = dao.ExcuteProducer(hxs);
                    Integer quanlity = Integer.parseInt(sl);
                    TypeProduct typeProduct = dao.ExcuteTypeProduct(loaihh);
                    Product product = new Product(masp, producer, typeProduct, tensp, price, quanlity, anh, ghichu);
                    SanphamDTO p = new SanphamDTO(product);
                    shop.ThemSanPham(p);
                    session.setAttribute("username", username1);
                    session.setAttribute("SHOP", shop);
                    RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
                    rd.forward(request, response);

//                    } else {
//                        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
//                        rd.forward(request, response);
//                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (action.equals("Login")) {

                String username1 = request.getParameter("username");
                String password1 = request.getParameter("password");

                if (dao.checklogin(username1, password1)) {
                    session.setAttribute("username", username1);
                    session.setAttribute("password", password1);
                    List<Customer> kh = dao.getListCustomers(username1);

                    for (Customer khachhang : kh) {
                        boolean vt = khachhang.getRoleCustomer();
                        if (vt == false) {
                           if(session.getAttribute("SHOP" )== null){
                                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                           }else{
                                RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
                            rd.forward(request, response);
                           }
                        } else {
                            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                            rd.forward(request, response);
                        }
                    }

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("Errorpage.jsp");
                    rd.forward(request, response);

                }

            } else if (action.equals("Pay")) {

                String username1 = (String) session.getAttribute("username");
                String password1 = (String) session.getAttribute("password");
                if (dao.checklogin(username1, password1)) {
                    try {
                        Connection con = ketnoi1.connetion();
                        PreparedStatement st = con.prepareStatement("insert into invoice(idproduct,amount,dateorder,total,usercustomer) values(?,?,?,?,?)");

                        String masp = request.getParameter("txtMasp");
                        String quanlity = request.getParameter("txtsl");
                        Date dateorder = Date.valueOf(LocalDate.now());
                        String price = request.getParameter("txtgia");

                        int gia = Integer.parseInt(price);
                        int sl = Integer.parseInt(quanlity);
                        int total = gia * sl;
                        st.setString(1, masp);
                        st.setInt(2, sl);
                        st.setDate(3, dateorder);
                        st.setInt(4, total);
                        st.setString(5, username1);
                   
                    boolean g= dao.getAmountProduct(masp,sl);           
                    
                          int m = st.executeUpdate();
                          if(g & m >0) {
                        	   RequestDispatcher rd = request.getRequestDispatcher("YourProduct.jsp");
                               rd.forward(request, response);

                          }
                     
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                }

            } else if (action.equals("View Cart")) {
                RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
                rd.forward(request, response);
            } else if (action.equals("AddMore")) {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if (action.equals("Remove")) {
                String[] list = request.getParameterValues("rmv");
                if (list != null) {

                    if (session != null) {
                        CartBean shop = (CartBean) session.getAttribute("SHOP");
                        if (shop != null) {
                            for (int i = 0; i < list.length; i++) {
                                shop.reMoveSP(list[i]);

                            }
                            session.setAttribute("SHOP", shop);
                        }
                    }
//						String url = "ControllerCartBean?action =View Cart";
                    RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("rmvInvoice")) {
                String id = request.getParameter("masp");
                int parse = Integer.parseInt(id);
                InvoiceDao dao1 = new InvoiceDao();
                dao1.Delete(parse);
                RequestDispatcher rd = request.getRequestDispatcher("YourProduct.jsp");
                rd.forward(request, response);
            } else if (action.equals("Signup")) {
                String tenkh = request.getParameter("name");
                String email = request.getParameter("email");
                String sdt = request.getParameter("phone");
                String diachi = request.getParameter("address");
                String username = request.getParameter("username1");
                String password = request.getParameter("password1");
                Customer kh = new Customer(username, password, tenkh, email, sdt, Boolean.FALSE, diachi);
                CustomerDao.InsertCustomer(kh);
               RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
                rd.forward(request, response);
            }else if(action.equals("Logout")){
                session.setAttribute("username", null);
                 RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        }
    }

    protected void Click(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String name = request.getParameter("acto");
        ProductDao dao = new ProductDao();
        List<Product> list = dao.FindbyName(name);
        session.setAttribute("LIST", list);
        RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
