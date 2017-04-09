package Controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Productdao;
import java.util.*;
import Model.*;
/**
 * Servlet implementation class PageServletpro
 */
@WebServlet("/PageServletpro")
public class PageServletpro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServletpro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("productall")){

			 Productdao prd =  new Productdao();
		         List<Product> listpr=  prd.fillall();
		         String page1 = "";
		         String page2 = "";
		         int start = 0;
		         int end;
		         if(listpr.size()<16){
		        	 end = listpr.size();
		         }else{
		        	 end = 8;
		         }
		         if(request.getParameter("start")!=null){
		        	 page1 = request.getParameter("start");
		        	 start = Integer.parseInt(page1);
		         }
		         
		         if(request.getParameter("end")!=null){
		        	 page2 = request.getParameter("end");
		        	 end = Integer.parseInt(page2);
		         }
		         List<Product> list = prd.getlist(listpr, start, end);
		         
		         
		       
				
			
		       
			request.setAttribute("list", list);
			request.getRequestDispatcher("Productall.jsp").forward(request, response);
		
	
	}
	}

}
