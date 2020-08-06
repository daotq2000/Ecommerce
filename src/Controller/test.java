/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;



import DAO.InvoiceDao;
import DAO.ProductDao;
import Model.Customer;
import Model.Invoice;
import Model.Producer;
import Model.Product;
import Model.TypeProduct;
import Util.HibernateUtil;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author Administrator
 */
public class test {
    public static void main(String[] args) {


       ProductDao dao = new ProductDao();
       
        Producer producer = dao.ExcuteProducer("Iphone");
        TypeProduct typeProduct = dao.ExcuteTypeProduct("Điện Thoại");
        Product sp = new Product("SP00013",producer,typeProduct,"Ipad E450",750,200,"SP13.jspg","Sang trọng");
        dao.SaveorUpdate(sp);
        

// 
//          Session session = HibernateUtil.getSessionFactory().openSession();
//    
//           
//                 String sql = "from Producer "+"where  nameProducer= ?";
//                 
//           session.beginTransaction();
//            Query query = session.createQuery(sql);
//            query.setParameter(0, "Iphone");
//            List<Producer> list;
//            list = query.list();
//            session.getTransaction().commit();
//            if(list.size() > 0){
//                System.out.println(list.get(0).getIdProducer());
//            }
//       
         
    }
}
