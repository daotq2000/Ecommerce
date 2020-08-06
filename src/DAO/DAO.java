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
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Administrator
 */
public interface  DAO {
 public void SaveorUpdate(Product model);
 public void Delete(String  id);
 public List<Product> getList();
public List<Producer>  getProducers( String value);
public List<TypeProduct>  getTypeProducts( String value);
public Producer findProducer(String name);
public TypeProduct findTypeProduct(String name);
public Producer ExcuteProducer(String name);
public TypeProduct ExcuteTypeProduct(String name);
public List<Product> FindbyName(String name);
public List<Customer> getListCustomers(String username);
public boolean checklogin(String username,String password);
public Product findbyID(String id);
public List<Invoice> getInvoices(String username);
public Customer findbyIDCustomer(String username);
public boolean getAmountProduct(String idProduct,int sl);
}
