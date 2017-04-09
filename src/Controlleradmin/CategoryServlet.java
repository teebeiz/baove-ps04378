package Controlleradmin;
import DAO.*;
import Model.Category;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
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
		Categorydao cad =  new Categorydao();
		
		Gson  gson =  new Gson();
		if(action.equalsIgnoreCase("showcate")){
			 out.print(gson.toJson(cad.findallca()));
			   out.flush();
			   out.close();
		}
		
		else if(action.equalsIgnoreCase("createcate")){
			 String catename =  request.getParameter("catename");
			
			 Category ca  =  new Category();
			 ca.setCate_name(catename);
			 cad.createca(ca);
		}
		
		else if(action.equalsIgnoreCase("detelecate")){
		    String cate_id =  request.getParameter("cate_id");
		    cad.deteles(Integer.parseInt(cate_id));
		}
		
		else if(action.equalsIgnoreCase("findcate")){
		    String cate_id =  request.getParameter("cate_id");
		     Category ca =  cad.find(Integer.parseInt(cate_id));
		    out.print(gson.toJson(ca));
		  
		}
		else if(action.equalsIgnoreCase("updatacate")){
		    String cate_id =  request.getParameter("cate_id");
		    String cate_name = request.getParameter("cate_name");
			 Category ca  =  new Category();
			 ca.setCate_id(Integer.parseInt(cate_id));
			 ca.setCate_name(cate_name);
			 cad.updataca(ca);
		  
		}
		
	}

}
