/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Invoice;
import Model.Product;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Administrator
 */
public class InvoiceDao {

    public void SaveorUpdate(Invoice model) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
         
           session.save(model);
            session.getTransaction().commit();

        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void Delete(int id) {
        Invoice model;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            session.beginTransaction();
            model =  (Invoice) session.load(Invoice.class, id);
            session.delete(model);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }public List<Invoice> getList( ) {
        
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<Invoice> list ;
        session.beginTransaction();
         String sql = "from Invoice";
            Query q = session.createQuery(sql);
            list=q.list();
            if(list.size() > 0){
                return  list;
            }
        
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
        return null;
    }
}
