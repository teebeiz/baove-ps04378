package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import Model.*;
import DAO.*;
public class Cutomerdao {


	       public List<Customer> findllcu(){
	    	   List<Customer> listcu =  new ArrayList<Customer>();
	    	   try {
                            PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from customers");
			    ResultSet rs =  ps.executeQuery();
			    while(rs.next()){
			    	Customer cu =  new Customer();
			    	cu.setEmail(rs.getString("Email"));
			    	cu.setPassword(rs.getString("password"));
			    	cu.setHoten(rs.getString("hoten"));
			    	listcu.add(cu);
			    }
			} catch (Exception e) {
				return listcu = null;
			}
	    	   return listcu;
	    	   
	       }
	
	
	
}
