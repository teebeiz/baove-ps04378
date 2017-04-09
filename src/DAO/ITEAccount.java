package DAO;

import java.util.List;

import Model.Account;

public interface ITEAccount {

	
	
	public void createaccount(Account ac);
	public List<Account> findll();
	public Account checlogin(String username,String password);
	
		

}
