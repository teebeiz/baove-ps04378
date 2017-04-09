package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.*;
import com.sun.accessibility.internal.resources.accessibility;

import Help.PasswordEncryption;
import Model.Account;

public class Accoundao  implements ITEAccount {

	@Override
	public void createaccount(Account ac) {
		try {
			
			PreparedStatement ps =  ConnectDatabase.getConnection().prepareStatement("insert into Customers values(?,?,?)");
			
			ps.setString(1, ac.getEmail());
			ps.setString(2, ac.getPassword());
			ps.setString(3, ac.getHoten());
			ps.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public List<Account> findll() {
	  List<Account> listca =  new ArrayList<Account>();
	try {
			
			PreparedStatement ps =  ConnectDatabase.getConnection().prepareStatement("select * from Customers");
			
		   ResultSet rs =  ps.executeQuery();
		   while(rs.next()){
			   Account ac =  new Account();
			   ac.setEmail(rs.getString("email"));
			   ac.setHoten(rs.getString("hoten"));
			   ac.setPassword(rs.getString("password"));
			   listca.add(ac);
		   }
	
			
		} catch (Exception e) {
			return listca = null;
		}
     	return listca;
	}
	
	@Override
	public Account checlogin(String email, String password) {
		  Account ac = null;
	
		try {
			PreparedStatement ps =  ConnectDatabase.
					getConnection().prepareStatement("select * from Customers where email=  ? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs  =  ps.executeQuery();
			while(rs.next()){
				 ac = new Account();
				   ac.setEmail(rs.getString("email"));
				   ac.setHoten(rs.getString("hoten"));
				   ac.setPassword(rs.getString("password"));
			}
			
			
		} catch (Exception e) {
			return ac=null;
		}
		
		return ac;
	}
	
	public static void main(String args[]){
		
		
		Accoundao acd = new Accoundao();
		Account ac =acd.checlogin("trongquyenafc@gmail.com", PasswordEncryption.MD5("1234567"));
		if(ac==null){
			System.out.println("account khong ton tai");
		}else{
			System.out.println("account  ton tai");
		}
		/*ac.setEmail("xasxas");
		ac.setHoten("cascas");
		ac.setPassword("casca");
		acd.createaccount(ac);*/
		
		
	}





	
	
}
