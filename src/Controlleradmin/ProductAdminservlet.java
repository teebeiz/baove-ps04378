package Controlleradmin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import DAO.Categorydao;
import DAO.Productdao;
import Model.Product;

/**
 * Servlet implementation class ProductAdminservlet
 */
@WebServlet("/ProductAdminservlet")
public class ProductAdminservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String  UPLOAD_DIR = "images";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdminservlet() {
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
		PrintWriter out =  response.getWriter();
		Productdao prd =  new Productdao();
		
		Gson  gson =  new Gson();
		if(action.equalsIgnoreCase("showpr")){
			 out.print(gson.toJson(prd.fillall()));
			   out.flush();
			   out.close();
		}
		
		else if(action.equalsIgnoreCase("createpro")){
			String pr_name = request.getParameter("pr_name");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String comment = request.getParameter("comment");
			String Status = request.getParameter("Status");
			String cate_id = request.getParameter("cate_id");
			String images = request.getParameter("images");
		    Product pr =  new Product();
		    pr.setPr_name(pr_name);
		    pr.setPrice(Long.parseLong(price));
		    pr.setQuantity(Integer.parseInt(quantity));
		    pr.setComment(comment);
		    pr.setStatus(Boolean.parseBoolean(Status));
		    pr.setCate_id(Integer.parseInt(cate_id));
		    pr.setImages(images);
		    prd.createpr(pr);
		    out.print(Status);
		}
		
		else if(action.equalsIgnoreCase("deteles")){
		    prd.detelepr(Integer.parseInt(request.getParameter("pr_id")));
		}
		
		else if(action.equalsIgnoreCase("findpr")){
		    out.print(gson.toJson(prd.fillpr(Integer.parseInt(request.getParameter("pr_id")))));
		}
		
		else if(action.equalsIgnoreCase("updatepro")){
			String pr_id = request.getParameter("pr_id");
			String pr_name = request.getParameter("pr_name");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String comment = request.getParameter("comment");
			String Status = request.getParameter("Status");
			String cate_id = request.getParameter("cate_id");
			String images = request.getParameter("images");
		    Product pr =  new Product();
		    pr.setPr_id(Integer.parseInt(pr_id));
		    pr.setPr_name(pr_name);
		    pr.setPrice(Long.parseLong(price));
		    pr.setQuantity(Integer.parseInt(quantity));
		    pr.setComment(comment);
		    pr.setStatus(Boolean.parseBoolean(Status));
		    pr.setCate_id(Integer.parseInt(cate_id));
		    pr.setImages(images);
		    prd.updatepr(pr);
		}
	
	}
	
	


}
