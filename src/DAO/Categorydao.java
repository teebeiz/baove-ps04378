package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Category;

public class Categorydao implements ITERcategoty {

	
	@Override
	public List<Category> findallca() {
		List<Category> listca =  new ArrayList<Category>();
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from category");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			      Category ca= new Category();
			      ca.setCate_id(rs.getInt("cate_id"));
			      ca.setCate_name(rs.getString("cate_name"));
			      listca.add(ca);
			}
		} catch (Exception e) {
			return listca=null;
		}
		
		return listca;
		
	}
	
	@Override
	public void createca(Category ca) {
		try {
			PreparedStatement ps =ConnectDatabase.getConnection().prepareStatement("insert into category values(?)");
			ps.setString(1, ca.getCate_name());
			ps.executeQuery();
		
		
		} catch (Exception e) {
			
		}
		
	
		
	}
	
	
	@Override
	public void deteles(int cate_id) {
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("delete from category where cate_id=?");
			ps.setInt(1, cate_id);
			ps.executeQuery();
		
		
		} catch (Exception e) {
			
		}
		
	}
	
	@Override
	public Category find(int cate_id) {
		Category ca = null;
		try {
			PreparedStatement ps =ConnectDatabase.getConnection().prepareStatement("select * from category where cate_id=?");
			ps.setInt(1, cate_id);
		    ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			      ca= new Category();
			      ca.setCate_id(rs.getInt("cate_id"));
			      ca.setCate_name(rs.getString("cate_name"));
			   
			}
		
		} catch (Exception e) {
			return ca=null;
		}
		return ca;
	}
	@Override
	public void updataca(Category ca) {
		try {
			PreparedStatement ps =ConnectDatabase.getConnection().prepareStatement("update category set cate_name=? where cate_id=?");
			ps.setString(1, ca.getCate_name());
			ps.setInt(2, ca.getCate_id());
			ps.executeQuery();
		
		
		} catch (Exception e) {
			
		}
		
		
	}
	public static void main(String [] args){
		
		Categorydao cad =  new Categorydao();
	/*	List<Category> listca =  cad.findallca();
		
		for(Category ca : listca){
			System.out.println(ca.getCate_id());
		}*/
		
		Category ca =  new Category();
	//	ca.setCate_name("quyen");
		//cad.createca(ca);
		
		
		Category cas =  cad.find(2);
		System.out.println(cas.getCate_id());
		System.out.println(cas.getCate_name());
		
		
		
		
	}

	



	




	
}
