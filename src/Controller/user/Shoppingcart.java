package Controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.*;
import Model.*;

/**
 * Servlet implementation class Shoppingcart
 */
@WebServlet("/Shoppingcart")
public class Shoppingcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Productdao prdao = new Productdao();
	private Orderdao ordao = new Orderdao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shoppingcart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		if (action.equalsIgnoreCase("buy")) {

			int pr_id = Integer.parseInt(request.getParameter("pr_id"));
			Product pr = prdao.fillpr(pr_id);
			buyproduct(session,pr_id,pr);
			count(session,out);

		}
  
		int n=0;
		long s = 0;
		List<Product> lstpr = (List<Product>) session.getAttribute("lstpr");
		for(Product pr: lstpr){
			n = n+ pr.getQuantity();
			s = s+ (pr.getQuantity()* pr.getPrice());
		}
	     
		session.setAttribute("n", n);
		session.setAttribute("s", s);
		
		if(action.equalsIgnoreCase("showcart")){
			showcarts(session);
			session.setAttribute("n", n);
			session.setAttribute("s", s);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
			
		}
		
		if(action.equalsIgnoreCase("detele")){
			
			int pr_id = Integer.parseInt(request.getParameter("pr_id"));
			session.setAttribute("lstprs", detelepr(pr_id,session));
		}
		
		
		
		 if(action.equalsIgnoreCase("update")){
				int pr_id = Integer.parseInt(request.getParameter("pr_id"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				
				
				session.setAttribute("lstprs", updates(session,pr_id,quantity));
		 }
		 
		 
		 if(action.equalsIgnoreCase("save")){
			 String name =  request.getParameter("name"); 
			 String phone =  request.getParameter("phone"); 
			 String email =  request.getParameter("email"); 
			 String address =  request.getParameter("address"); 
			 String totail =  request.getParameter("totail");
				
			
			Order or = new Order();
			Date date = new Date();
			or.setData_trans(date);
			or.setTotail(Long.parseLong(totail));
			or.setStatus(false);
			or.setMethod("");
			or.setCustomername(name);
			or.setSdt(phone);
			or.setEmail(email);
			or.setAddress(address);
			or.setTx("");
			ordao.create(or);
			or = ordao.find();
			List<Product> lstprs = (List<Product>) session.getAttribute("lstpr");
			List<Order_details> lstde = new ArrayList<Order_details>();
			for(Product pr:lstprs){
				lstde.add(new Order_details(or.getID(), pr.getPr_id(), pr.getPrice(), pr.getQuantity()));
			}
			for(Order_details od:lstde){
				ordao.createde(od);
			}
				
				
			
		 }
		 
		 

	}
	
	public void buyproduct(HttpSession session,int pr_id,Product pr){
		if (session.getAttribute("lstpr") == null) {
			List<Product> lstpr = new ArrayList<Product>();
			lstpr.add(pr);
			session.setAttribute("lstpr", lstpr);
		} else {
			Boolean flag = false;
			List<Product> lstpr = (List<Product>) session.getAttribute("lstpr");
			for (Product prs : lstpr) {
				if (prs.getPr_id() == pr.getPr_id()) {
					prs.setQuantity(prs.getQuantity() + 1);
					flag = true;
				}
			}

			if (flag) {

			} else {
				lstpr.add(pr);
			}

			session.setAttribute("lstpr", lstpr);
		}
	}
	
	
	public void count(HttpSession session,PrintWriter out){
		int n=0;
		List<Product> lstpr = (List<Product>) session.getAttribute("lstpr");
		for(Product prs:lstpr){
			n = n+ prs.getQuantity();
		}
	     
		session.setAttribute("n", n);
		out.print(session.getAttribute("n"));
	}
	
	
	
	public void showcarts(HttpSession session){
		List<Product> lstprs = (List<Product>) session.getAttribute("lstpr");
		session.setAttribute("lstprs", lstprs);
	}
	
	
	
	public List<Product> detelepr(int pr_id,HttpSession session ){
		List<Product> lstprs = (List<Product>) session.getAttribute("lstpr");
		for(int i = lstprs.size()-1;i>=0;i--){
			  if(lstprs.get(i).getPr_id()==pr_id){
				   lstprs.remove(lstprs.get(i));
			   }
		}
		return lstprs;
	}
	
	
	
	public List<Product> updates(HttpSession session,int pr_id,int quantity){
		List<Product> lstprs = (List<Product>) session.getAttribute("lstpr");
		for(Product pr:lstprs){
			if(pr.getPr_id()==pr_id){
				pr.setQuantity(quantity);
			}
		}
		
		return lstprs;
	}
	

}
