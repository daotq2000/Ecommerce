/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Customer;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;



/**
 *
 * @author Administrator
 */
public class CustomerDao {
   public static void InsertCustomer(Customer model){
       Session session = HibernateUtil.getSessionFactory().openSession();
       try {
           session.beginTransaction();
           session.save(model);
           session.getTransaction().commit();
       } catch (Exception e) {
           session.getTransaction().rollback();
       }finally{
           session.close();
       }
   }
    public static void UpdateCustomer(Customer model){
       Session session = HibernateUtil.getSessionFactory().openSession();
       try {
           session.beginTransaction();
           session.update(model);
           session.getTransaction().commit();
       } catch (Exception e) {
           session.getTransaction().rollback();
       }finally{
           session.close();
       }
   }
      public static void DeleteCustomer(String username){
       Session session = HibernateUtil.getSessionFactory().openSession();
       try {
           Customer model;
           session.beginTransaction();
           model = (Customer) session.load(Customer.class, username);
           session.delete(model);
           session.getTransaction().commit();
       } catch (Exception e) {
           session.getTransaction().rollback();
       }finally{
           session.close();
       }
   }
       public List<Customer> getListCustomers() {
              Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            List<Customer> list ;
            String sql = "from Customer";
            
            Query q = session.createQuery(sql);
           
            list = q.list();
            session.getTransaction().commit();
            if(list.size() > 0){
                return list;
            }
        } catch (HibernateException e) {
        session.getTransaction().rollback();
        e.printStackTrace();
        }finally{
            session.close();
                    
        }
        return null;
    }  public static List<Customer> Search(String username) {
              Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            List<Customer> list ;
            String sql = "from Customer where  userCustomer like ? or  nameCustomer like ?";
            
            
            Query q = session.createQuery(sql);
            q.setParameter(0, "%"+username+"%");
                  q.setParameter(1, "%"+username+"%");   
           
            list = q.list();
            session.getTransaction().commit();
            if(list.size() > 0){
                return list;
            }
        } catch (HibernateException e) {
        session.getTransaction().rollback();
        e.printStackTrace();
        }finally{
            session.close();
                    
        }
        return null;
    }
}
