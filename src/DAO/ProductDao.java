/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Customer;
import Model.Invoice;
import Model.Producer;
import Model.Product;
import Model.TypeProduct;
import Util.HibernateUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import Controller.ketnoi1;

/**
 *
 * @author Administrator
 */
public class ProductDao implements DAO{

    @Override
    public void SaveorUpdate(Product model) {
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
   @Override
    public void Delete( String id) {
        Product model ;
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 
        session.beginTransaction();
        model =  (Product) session.load(Product.class, id);
        session.delete(model);
        session.getTransaction().commit();
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
    }
    
  

    @Override
    public List<Product> getList( ) {
        
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<Product> list ;
        session.beginTransaction();
         String sql = "from Product";
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

    public List findAll(Class clazz) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Producer> getProducers( String value) {
        List list = null;
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
           
                 String sql = "from Producer where nameProducer = ?";
                 
           session.beginTransaction();
            Query query = session.createQuery(sql);
            query.setParameter(0, value);
            list = query.list();
            session.getTransaction().commit();
            if(list.size() > 0){
                return list;
            }
        } catch (HibernateException e) {
           session.getTransaction().rollback();
              e.printStackTrace();
        } 
        return null;
    }

    @Override
    public List<TypeProduct> getTypeProducts(String value) {
     List list = null;
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
           
                 String sql = "from TypeProduct where nameProductType = ?";
           session.beginTransaction();
            Query query = session.createQuery(sql);
            query.setParameter(0, value);
            list = query.list();
            session.getTransaction().commit();
            if(list.size() > 0){
                return list;
            }
        } catch (HibernateException e) {
           session.getTransaction().rollback();
              e.printStackTrace();
        } 
        return null;
    }

    @Override
    public Producer findProducer(String name) {
     Producer obj = null;
       Session   session= HibernateUtil.getSessionFactory().getCurrentSession();
        try {
        
            
          
                        
           session.beginTransaction();
            obj = (Producer) session.load(Producer.class, name);
                  session.getTransaction().commit();
        } catch (HibernateException e) {
                   session.getTransaction().rollback();
              e.printStackTrace();
        } finally {
                    
        }
        return obj;
    }

    @Override
    public TypeProduct findTypeProduct(String name) {
           TypeProduct obj = null;
       Session   session= HibernateUtil.getSessionFactory().getCurrentSession();
        try {
        
            
          
                       
           session.beginTransaction();
            obj = (TypeProduct) session.load(TypeProduct.class, name);
                  session.getTransaction().commit();
        } catch (HibernateException e) {
                   session.getTransaction().rollback();
              e.printStackTrace();
        } finally {
                    
        }
        return obj;
    }



    @Override
    public Producer ExcuteProducer(String name) {
        List<Producer> list = getProducers( name);
   Producer producer = findProducer(list.get(0).getIdProducer());
   if(list == null){
       System.out.println("null");
   }
   return producer;
    }

    @Override
    public TypeProduct ExcuteTypeProduct(String name) {
       List<TypeProduct> list = getTypeProducts( name);
   TypeProduct TypeProduct = findTypeProduct(list.get(0).getIdProductType());
   return TypeProduct;
    }

    @Override
    public List<Product> FindbyName(String name) {
        
       Session session = HibernateUtil.getSessionFactory().openSession();
        try {
                 List<Product> list ;
        session.beginTransaction();
       
         String sql = "from Product where NameProduct like ? or IdProduct like ?";
         
            Query q = session.createQuery(sql);
            q.setParameter(0, '%'+name+'%');
            q.setParameter(1, '%'+name+'%');
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

    @Override
    public List<Customer> getListCustomers(String username) {
              Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            List<Customer> list ;
            String sql = "from Customer where UserCustomer =?";
            
            Query q = session.createQuery(sql);
            q.setParameter(0, username);
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

    @Override
    public boolean checklogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String sql = "from Customer where UserCustomer = ? and PasswordCustomer =?";
           Query query = session.createQuery(sql);
           query.setParameter(0, username);
           query.setParameter(1, password);
         List<Customer> list = query.list();
         session.getTransaction().commit();
            if(list.size() > 0 ){
            return true;
        }
  
        } catch (Exception e) {
            session.getTransaction().rollback();
                    
        }
             return false;
    }

    @Override
    public Product findbyID(String id) {
      Product obj = null;
        Session  session= HibernateUtil.getSessionFactory().getCurrentSession();
        try {
        
             
          
                        
           session.beginTransaction();
            obj = (Product) session.load(Product.class, id);
                  session.getTransaction().commit();
        } catch (HibernateException e) {
                   session.getTransaction().rollback();
              e.printStackTrace();
        } finally {
                    
        }
        return obj;
    }

    @Override
    public List<Invoice> getInvoices(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Customer findbyIDCustomer(String username) {
   Customer obj = null;
        Session  session= HibernateUtil.getSessionFactory().getCurrentSession();
        try {
        
             
          
                        
           session.beginTransaction();
            obj = (Customer) session.load(Customer.class, username);
                  session.getTransaction().commit();
        } catch (HibernateException e) {
                   session.getTransaction().rollback();
              e.printStackTrace();
        } finally {
                    
        }
        return obj;   
    }

 @Override
public boolean getAmountProduct(String idProduct,int sl) {
		Connection con = ketnoi1.connetion();
		PreparedStatement st;
		int SlKho = 0;
		try {
			PreparedStatement st2 = con.prepareStatement("select amout from product where idProduct = ?");
			st2.setString(1, idProduct);
			ResultSet rs = st2.executeQuery();
			while(rs.next()) {
				SlKho = rs.getInt(1);
			}
			st = con.prepareStatement("update product set amout = ? where idProduct = ?");
			st.setInt(1, SlKho-sl);
			st.setString(2, idProduct);
			st.executeUpdate();
			System.out.println("Success");
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	
}
}
