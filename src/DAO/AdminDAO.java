/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Producer;
import Model.Product;
import Model.TypeProduct;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Administrator
 */
public class AdminDAO {
    public void SaveorUpdateHXS(Producer model) {
           Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 
        session.beginTransaction();
        session.saveOrUpdate(model);
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public void DeleteHXS( String id) {
        Producer model ;
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 
        session.beginTransaction();
        model =  (Producer) session.load(Producer.class, id);
        session.delete(model);
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
    }
        public void SaveorUpdatePL(TypeProduct model) {
           Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 
        session.beginTransaction();
        session.saveOrUpdate(model);
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }

    }public List<Producer> getListProducer(){
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<Producer> list ;
        session.beginTransaction();
         String sql = "from Producer";
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
    
    public List<TypeProduct> getListTypeProduct(){
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<TypeProduct> list ;
        session.beginTransaction();
         String sql = "from TypeProduct";
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
     public List<TypeProduct> SearchTypeProduct(String name){
           Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<TypeProduct> list ;
        session.beginTransaction();
         String sql = "from TypeProduct where NameProductType like ? or IdProductType like ?";
            Query q = session.createQuery(sql);
            q.setParameter(0, "%"+name+"%");
            q.setParameter(1, "%"+name+"%");
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
public List<Producer> SearchProducer(String name){
           Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<Producer> list ;
        session.beginTransaction();
         String sql = "from Producer where NameProducer like ? or IdProducer like?";
            Query q = session.createQuery(sql);
            q.setParameter(0, "%"+name+"%");
            q.setParameter(1, "%"+name+"%");
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
    public void DeletePL( String id) {
        TypeProduct model ;
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 
        session.beginTransaction();
        model =  (TypeProduct) session.load(TypeProduct.class, id);
        session.delete(model);
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
    }
}
