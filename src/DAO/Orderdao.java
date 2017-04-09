package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Model.Order;
import Model.Order_details;

public class Orderdao implements IEorder {

	@Override
	public void create(Order or) {
		try {
			PreparedStatement ps1 = ConnectDatabase.getConnection().prepareStatement("insert into Orders values(?,?,?,?,?,?,?,?,?)");
			ps1.setDate(1, new java.sql.Date(or.getData_trans().getTime()));
			ps1.setLong(2, or.getTotail());
			ps1.setBoolean(3, or.isStatus());
			ps1.setString(4, or.getMethod());
			ps1.setString(5, or.getCustomername());
			ps1.setString(6, or.getSdt());
			ps1.setString(7, or.getEmail());
			ps1.setString(8, or.getAddress());

			ps1.setString(9, or.getTx());
			ps1.executeQuery();

		} catch (Exception e) {

		}
	}

	@Override
	public void createde(Order_details od) {
		try {

			PreparedStatement ps2 = ConnectDatabase.getConnection().prepareStatement("insert into Order_details values(?,?,?,?)");

			ps2.setInt(1, od.getOrder_ID());
			ps2.setInt(2, od.getProduct_ID());
			ps2.setLong(3, od.getPrice());
			ps2.setInt(4, od.getQuantity());
			ps2.executeQuery();

		} catch (Exception e) {

		}

	}
	
	

	@Override
	public Order find() {
		   Order or = null;
			try {
				PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select  top 1 id from Orders order by id desc");
				ResultSet rs =  ps.executeQuery();
				while(rs.next()){
					or = new Order();
					or.setID(rs.getInt("ID"));
				}
			} catch (Exception e) {
				return or = null;
			}
			
			return or;
	}
	
	@Override
	public List<Order> listfind() {
		 List<Order> listor = new ArrayList<Order>();
				try {
					PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from Orders");
					ResultSet rs =  ps.executeQuery();
					while(rs.next()){
					  Order	or = new Order();
						or.setID(rs.getInt("ID"));
						or.setData_trans(rs.getDate("data_trans"));
						or.setTotail(rs.getLong("totail"));
						or.setStatus(rs.getBoolean("Status"));
						or.setAddress(rs.getString("method"));
						or.setCustomername(rs.getString("customername"));
						or.setSdt(rs.getString("sdt"));
						or.setEmail(rs.getString("email"));
						or.setAddress(rs.getString("Address"));
						or.setTx(rs.getString("tx"));
						listor.add(or);
					}
				} catch (Exception e) {
					return listor = null;
				}
				
				return listor;
	}
	
	
	
	@Override
	public List<Order_details> findllde() {
		 List<Order_details> listorde = new ArrayList<Order_details>();
			try {
				PreparedStatement ps = ConnectDatabase.getConnection().prepareStatement("select * from Order_details");
				ResultSet rs =  ps.executeQuery();
				while(rs.next()){
				  Order_details orde = new Order_details();
					orde.setOrder_ID(rs.getInt("Order_ID"));
					orde.setProduct_ID(rs.getInt("product_ID"));
					orde.setPrice(rs.getLong("price"));
					orde.setQuantity(rs.getInt("quantity"));
				
					listorde.add(orde);
				}
			} catch (Exception e) {
				return listorde = null;
			}
			
			return listorde;
	}
	
	public static void main(String args[]){
		
		Date date = new Date();
		Orderdao odao =  new Orderdao();
		/*Order or =  new Order();
		or.setData_trans(date);
		or.setTotail(122);
		or.setStatus(false);
		or.setMethod("");
		or.setCustomername("quyen");
		or.setSdt("233333");
		or.setEmail("quyen@");
		or.setAddress("phu quy");
		or.setTx("");
		odao.create(or);
		or = odao.find();
		System.out.println(or.getID());
		
		List<Order_details> lstde = new ArrayList<Order_details>();
		lstde.add(new Order_details(or.getID(), 1, 12, 1));
		lstde.add(new Order_details(or.getID(), 2, 121, 2));
		for(Order_details od:lstde){
			odao.createde(od);
		}*/
		
		
		
	}





}
