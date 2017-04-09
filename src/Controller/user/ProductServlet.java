package Controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Productdao;
import Model.Product;

/**
 * Servlet implementation class ProductServlet
 */

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     Productdao prd =  new Productdao();
    public ProductServlet() {
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
		
		String action =  request.getParameter("action");
		if(action.equalsIgnoreCase("products")){
			int cate_id = Integer.parseInt(request.getParameter("cate_id"));
			List<Product> pr =  prd.fillallprca(cate_id);
			request.setAttribute("listpr", pr);
			Productdao prd = new Productdao();
			request.setAttribute("prd", prd);
			request.setAttribute("cate_id", request.getParameter("cate_id"));
			request.getRequestDispatcher("products.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("single")){
			int pr_id = Integer.parseInt(request.getParameter("pr_id"));
			Product pr =  prd.fillpr(pr_id);
			request.setAttribute("pr", pr);
			request.setAttribute("listprre", prd.fillallprrela(pr.getCate_id(), pr.getPr_id()));
			Productdao prd = new Productdao();
			request.setAttribute("prd", prd);
			request.setAttribute("pr_id", request.getParameter("pr_id"));
			request.getRequestDispatcher("single.jsp").forward(request, response);
			
		}
		
		
		else if(action.equalsIgnoreCase("productll")){
		
		}
		
	}

}
