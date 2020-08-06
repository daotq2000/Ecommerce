package Test;

import org.hibernate.HibernateException;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

 

import DAO.AdminDAO;
import Model.Producer;

public class TestDAO {
private AdminDAO dao = new AdminDAO();
private Producer pro;
@BeforeMethod
public void setup() {
pro = new Model.Producer();
}
@AfterMethod
public void destroy() {
	pro = null;
}
@Test
public void TestDAO() throws HibernateException {
	pro.setIdProducer("                               ");
	pro.setNameProducer(" ");
	dao.SaveorUpdateHXS(pro);
}
}
