package Controlleradmin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Orderdao;
import DAO.*;
/**
 * Servlet implementation class Shoppingcarservlet
 */
@WebServlet("/Shoppingcarservlet")
public class Shoppingcarservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Orderdao ordao = new Orderdao();
    private Cutomerdao cudao = new Cutomerdao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Shoppingcarservlet() {
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
	    	Gson gson =  new Gson();
	        if(action.equalsIgnoreCase("showor")){
	        	out.print(gson.toJson(ordao.listfind()));
	        	out.flush();
	        	out.close();
	        }
	        else if(action.equalsIgnoreCase("showorde")){
	        	out.print(gson.toJson(ordao.findllde()));
	        	out.flush();
	        	out.close();
	        }
	        else if(action.equalsIgnoreCase("showcus")){
	        	out.print(gson.toJson(cudao.findllcu()));
	        	out.flush();
	        	out.close();
	        }
		
	}

}
