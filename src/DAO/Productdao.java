package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Category;
import Model.Product;

public class Productdao implements ITERproduct {
	
	@Override
	public void createpr(Product pr) {
		try {
			PreparedStatement ps =  
                        ConnectDatabase.getConnection().prepareStatement("insert into Product values(?,?,?,?,?,?,?)");
			ps.setString(1, pr.getPr_name());
			ps.setLong(2, pr.getPrice());
			ps.setInt(3, pr.getQuantity());
			ps.setString(4, pr.getComment());
			ps.setBoolean(5, pr.isStatus());
			ps.setInt(6, pr.getCate_id());
			ps.setString(7, pr.getImages());
			ps.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	@Override
	public void detelepr(int pr_id) {
		try {
			PreparedStatement ps = 
                        ConnectDatabase.getConnection().prepareStatement("delete from Product where pr_id=?");
			ps.setInt(1, pr_id);
			ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	@Override
	public void updatepr(Product pr) {
		try {
                PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("update Product set pr_name =?,price=?,quantity=?,comment=?,Status=?,cate_id=?,images=? where pr_id=?");
			ps.setString(1, pr.getPr_name());
			ps.setLong(2, pr.getPrice());
			ps.setInt(3, pr.getQuantity());
			ps.setString(4, pr.getComment());
			ps.setBoolean(5, pr.isStatus());
			ps.setInt(6, pr.getCate_id());
			ps.setString(7, pr.getImages());
			ps.setInt(8, pr.getPr_id());
	
			ps.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	@Override
	public List<Product> fillallpr() {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select top 8* from Product where Status=1 order by pr_id desc");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}
	
	@Override
	public List<Product> fillallpr1() {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps =  ConnectDatabase.getConnection().prepareStatement("select top 4* from Product where Status=1 order by pr_id desc");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}
	
	@Override
	public List<Product> fillallpr2() {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps =  ConnectDatabase.getConnection().prepareStatement("select top 4* from Product where images in ('pr.jpg','pr1.jpg','pr2.jpg','pr3.jpg')");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}

	
	
	@Override
	public List<Product> fillallprca(int cate_id) {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps =ConnectDatabase.getConnection().prepareStatement("select * from Product where cate_id=?");
			ps.setInt(1, cate_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}
	
	
	@Override
	public Product fillpr(int pr_id) {
		Product pr =  null;
		try {
			PreparedStatement ps =ConnectDatabase.getConnection().prepareStatement("select * from Product where pr_id=?");
			ps.setInt(1, pr_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			   pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			
			}
		} catch (Exception e) {
			return pr=null;
		}
		
		return pr;
	}
	
	
	@Override
	public List<Product> fillallprrela( int cate_id, int pr_id) {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select top 3* from Product where cate_id=? and pr_id != ? order by pr_id desc");
			ps.setInt(1, cate_id);
			ps.setInt(2, pr_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}
	@Override
	public List<Product> fillall() {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps =  
		ConnectDatabase.
		getConnection().prepareStatement("select * from Product");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}
	
	@Override
	public List<Product> getlist(List<Product> listpr, int start, int end) {
		List<Product> listprs = new ArrayList<Product>();
		for(int i=start;i<end;i++){
			listprs.add(listpr.get(i));
		}
		return listprs;
		
	}
	
	
	@Override
	public List<Product> search(String pr_name) {
		List<Product> listpr =  new ArrayList<Product>();
		try {
			PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from product  where pr_name like ?");
			ps.setString(1, pr_name+"%");
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
			     Product pr = new Product();
			     pr.setPr_id(rs.getInt("pr_id"));
			     pr.setPr_name(rs.getString("pr_name"));
			     pr.setPrice(rs.getLong("price"));
			     pr.setQuantity(rs.getInt("quantity"));
			     pr.setComment(rs.getString("comment"));
			     pr.setStatus(rs.getBoolean("Status"));
			     pr.setCate_id(rs.getInt("cate_id"));
			     pr.setImages(rs.getString("images"));
			     listpr.add(pr);
			}
		} catch (Exception e) {
			return listpr=null;
		}
		
		return listpr;
	}

	
	public static void main(String [] args){
		
		Productdao prd = new Productdao();
		List<Product> listpr =  prd.search("A1");
		for(Product pr: listpr){
			System.out.println(pr.getPr_name());
		}
	/*	for(Product pr : listpr){
			System.out.println(pr.getPr_id());
			System.out.println(pr.getImages());
		}*/
		
	//	Product pr = prd.fillpr(2);
	//	System.out.println(pr.getPr_id());
		
		/*Product pr = new Product();
		pr.setPr_name("csdcsd");
		pr.setPrice(2000);
		pr.setComment("dcsdc");
		pr.setQuantity(1);
		pr.setCate_id(2);
		pr.setImages("csdc");
		pr.setStatus(true);
		prd.createpr(pr);*/
		
		//prd.detelepr(21);
		

		
	}
	








	








}
