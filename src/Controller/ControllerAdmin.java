/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AdminDAO;
import DAO.CustomerDao;
import DAO.ProductDao;
import Model.Customer;
import Model.Producer;
import Model.Product;
import Model.TypeProduct;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ControllerAdmin extends HttpServlet {

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
            ProductDao dao = new ProductDao();
            int index = 5;
            List<Product> list = dao.getList();
            HttpSession session = request.getSession(true);
            String action = request.getParameter("action");
            if (action.equals("Insert")) {
                String masp = request.getParameter("masp");
                String tensp = request.getParameter("tensp");
                String anh = request.getParameter("image");
                String gia = request.getParameter("price");
                String sl = request.getParameter("amount");
                String ghichu = request.getParameter("ghichu");
                String hxs = request.getParameter("hxs");
                String pl = request.getParameter("pl");
                Integer price = Integer.parseInt(gia);
                Integer amount = Integer.parseInt(sl);
                Producer producer = dao.ExcuteProducer(hxs);
                TypeProduct typeProduct = dao.ExcuteTypeProduct(pl);
                Product sp = new Product(masp, producer, typeProduct, tensp, price, amount, anh, ghichu);
                dao.SaveorUpdate(sp);
                RequestDispatcher rd = request.getRequestDispatcher("SanPham.jsp");
                rd.forward(request, response);
            } else if (action.equals("Update")) {
                String masp = request.getParameter("masp");
                String tensp = request.getParameter("tensp");
                String anh = request.getParameter("image");
                String gia = request.getParameter("price");
                String sl = request.getParameter("amount");
                String ghichu = request.getParameter("ghichu");
                String hxs = request.getParameter("hxs");
                String pl = request.getParameter("pl");
                Integer price = Integer.parseInt(gia);
                Integer amount = Integer.parseInt(sl);
                Producer producer = dao.ExcuteProducer(hxs);
                TypeProduct typeProduct = dao.ExcuteTypeProduct(pl);
                Product sp = new Product(masp, producer, typeProduct, tensp, price, amount, anh, ghichu);
                dao.SaveorUpdate(sp);
                RequestDispatcher rd = request.getRequestDispatcher("SanPham.jsp");
                rd.forward(request, response);
            } else if (action.equals("Delete")) {
                String masp = request.getParameter("masp");
                dao.Delete(masp);
                RequestDispatcher rd = request.getRequestDispatcher("SanPham.jsp");
                rd.forward(request, response);

            } else if (action.equals("Search")) {
                String search = request.getParameter("search");
                List<Product> listsearch = dao.FindbyName(search);
                session.setAttribute("list", listsearch);
                RequestDispatcher rd = request.getRequestDispatcher("SanPham.jsp");
                rd.forward(request, response);
            } else if (action.equals("New")) {
                session.setAttribute("list", null);
                RequestDispatcher rd = request.getRequestDispatcher("SanPham.jsp");
                rd.forward(request, response);
            } else if (action.equals("SearchHXS")) {
                String search = request.getParameter("search");
                AdminDAO dao1 = new AdminDAO();
                List<Producer> listsearch = dao1.SearchProducer(search);
                session.setAttribute("listHXS", listsearch);
                RequestDispatcher rd = request.getRequestDispatcher("Producer.jsp");
                rd.forward(request, response);
            } else if (action.equals("SearchPL")) {
                String search = request.getParameter("search");
                AdminDAO dao1 = new AdminDAO();
                List<TypeProduct> listsearch = dao1.SearchTypeProduct(search);
                session.setAttribute("listPL", listsearch);
                RequestDispatcher rd = request.getRequestDispatcher("ProductType.jsp");
                rd.forward(request, response);
            } else if (action.equals("NewHXS")) {
                session.setAttribute("listHXS", null);

                RequestDispatcher rd = request.getRequestDispatcher("Producer.jsp");
                rd.forward(request, response);
            } else if (action.equals("NewPL")) {
                session.setAttribute("listPL", null);
                RequestDispatcher rd = request.getRequestDispatcher("ProductType.jsp");
                rd.forward(request, response);
            } else if (action.equals("InsertHXS")) {
                String mahxs = request.getParameter("mahxs");
                String tenhxs = request.getParameter("tenhxs");
                Producer hxs = new Producer(mahxs, tenhxs);
                AdminDAO dao1 = new AdminDAO();
                dao1.SaveorUpdateHXS(hxs);
                RequestDispatcher rd = request.getRequestDispatcher("Producer.jsp");
                rd.forward(request, response);
            } else if (action.equals("DeleteHXS")) {
                String mahxs = request.getParameter("mahxs");
                AdminDAO dao1 = new AdminDAO();
                dao1.DeleteHXS(mahxs);
                RequestDispatcher rd = request.getRequestDispatcher("Producer.jsp");
                rd.forward(request, response);
            } else if (action.equals("UpdateHXS")) {
                String mahxs = request.getParameter("mahxs");
                String tenhxs = request.getParameter("tenhxs");
                Producer hxs = new Producer(mahxs, tenhxs);
                AdminDAO dao1 = new AdminDAO();
                dao1.SaveorUpdateHXS(hxs);
                RequestDispatcher rd = request.getRequestDispatcher("Producer.jsp");
                rd.forward(request, response);
            } else if (action.equals("InsertPL")) {
                String mapl = request.getParameter("mapl");
                String tenpl = request.getParameter("tenpl");
                TypeProduct pl = new TypeProduct(mapl, tenpl);
                AdminDAO dao1 = new AdminDAO();
                dao1.SaveorUpdatePL(pl);
                RequestDispatcher rd = request.getRequestDispatcher("ProductType.jsp");
                rd.forward(request, response);
            } else if (action.equals("DeletePL")) {
                String mapl = request.getParameter("mapl");

                AdminDAO dao1 = new AdminDAO();
                dao1.DeletePL(mapl);
                RequestDispatcher rd = request.getRequestDispatcher("ProductType.jsp");
                rd.forward(request, response);
            } else if (action.equals("UpdatePL")) {
                String mapl = request.getParameter("mapl");
                String tenpl = request.getParameter("tenpl");
                TypeProduct pl = new TypeProduct(mapl, tenpl);
                AdminDAO dao1 = new AdminDAO();
                dao1.SaveorUpdatePL(pl);
                RequestDispatcher rd = request.getRequestDispatcher("ProductType.jsp");
                rd.forward(request, response);
            } else if (action.equals("InsertKH")) {
                String tenkh = request.getParameter("tenkh");
                String email = request.getParameter("email");
                String sdt = request.getParameter("sdt");
                String diachi = request.getParameter("diachi");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String vt = request.getParameter("vaitro");
                boolean role;
                if (vt.equals("0")) {
                    role = false;
                } else {
                    role = true;
                }

                Customer kh = new Customer(username, password, tenkh, email, sdt, role, diachi);
                CustomerDao.InsertCustomer(kh);
                RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
                rd.forward(request, response);
            } else if (action.equals("UpdateKH")) {
                String tenkh = request.getParameter("tenkh");
                String email = request.getParameter("email");
                String sdt = request.getParameter("sdt");
                String diachi = request.getParameter("diachi");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String vt = request.getParameter("vaitro");
                boolean role;
                if (vt.equals("0")) {
                    role = false;
                } else {
                    role = true;
                }

                Customer kh = new Customer(username, password, tenkh, email, sdt, role, diachi);
                CustomerDao.UpdateCustomer(kh);
                       RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
                rd.forward(request, response);
            } else if (action.equals("DeleteKH")) {
                String username = request.getParameter("username");
                CustomerDao.DeleteCustomer(username);
                response.sendRedirect("Customer.jsp");

            } else if (action.equals("NewKH")) {
                                session.setAttribute("listkh", null);
 RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
                rd.forward(request, response);
            } else if (action.equals("SearchKH")) {
                String search = request.getParameter("search");

                List<Customer> listkh = CustomerDao.Search(search);
                session.setAttribute("listkh", listkh);
                RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
                rd.forward(request, response);
            }else if (action.equals("UpdateAcount")) {
                String tenkh = request.getParameter("tenkh");
                String email = request.getParameter("email");
                String sdt = request.getParameter("sdt");
                String diachi = request.getParameter("diachi");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String vt = request.getParameter("vaitro");
                boolean role;
               

                Customer kh = new Customer(username, password, tenkh, email, sdt, Boolean.FALSE, diachi);
                CustomerDao.UpdateCustomer(kh);
                       RequestDispatcher rd = request.getRequestDispatcher("Acount.jsp");
                rd.forward(request, response);
            }
        }
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
