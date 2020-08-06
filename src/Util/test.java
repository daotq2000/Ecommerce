package Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Query;
import org.hibernate.Session;

import Controller.ketnoi1;
import DAO.ProductDao;
import Model.Product;
import Util.HibernateUtil;
public class test {
public static void main(String[] args) {
//	Session session = HibernateUtil.getSessionFactory().openSession();
//	
//	try {
//		Product sp = new Product();
//		sp.setIdProduct("SP001");
//		sp.setAmout(10);
//		session.update(sp);
//		session.getTransaction().commit();
//		System.out.println("Success");
//	} catch (Exception e) {
//		session.getTransaction().rollback();;
//		e.printStackTrace();
//	
//	}
	Connection con = ketnoi1.connetion();
	PreparedStatement st;
	try {
		PreparedStatement st2 = con.prepareStatement("select amout from product where idProduct = ?");
		
		ResultSet rs = st2.executeQuery();
		while(rs.next()) {
			System.out.println(rs.getInt(1));
		}
		st = con.prepareStatement("update product set amout = ? where idProduct = ?");
		st.setInt(1, 10);
		st.setString(2, "Sp001");
		st.executeUpdate();
		System.out.println("Success");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
}
