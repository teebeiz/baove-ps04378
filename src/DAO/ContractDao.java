package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.*; 
public class ContractDao {

	
	public void createcontract(Contract ct){
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("insert into contract values(?,?,?,?)");
			ps.setString(1, ct.getName());
			ps.setString(2, ct.getEmail());
			ps.setString(3, ct.getPhone());
			ps.setString(4, ct.getMessage());
			 ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<Contract> showcontract(){
		List<Contract> listco =  new ArrayList<Contract>();
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from contract");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				Contract co = new Contract();
				co.setId(rs.getInt("id"));
				co.setName(rs.getString("name"));
				co.setEmail(rs.getString("email"));
				co.setPhone(rs.getString("phone"));
				co.setMessage(rs.getString("message"));
				listco.add(co);
			}
			 
		} catch (Exception e) {
			return listco=null;
		}
		
		return listco;
	}
	
	
	public void detele(int id){
		try {
			PreparedStatement ps = ConnectDatabase.
					getConnection().prepareStatement("delete from contract where id=?");
			ps.setInt(1, id);
			 ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void main(String args []){
		
		Contract co =  new Contract();
		co.setName("csdcs");
		co.setEmail("csdcs");
		co.setPhone("csdcsd");
		co.setMessage("sdcsdcs");
		ContractDao codao = new ContractDao();
		codao.createcontract(co);
		
	}
	
}
