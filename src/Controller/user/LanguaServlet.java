package Controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LanguaServlet
 */
@WebServlet("/LanguaServlet")
public class LanguaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LanguaServlet() {
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
		   String lang =  request.getParameter("lang");
		   String action =  request.getParameter("action");
	       
		  
		   
			HttpSession session =  request.getSession();
			
			
			if(action.equalsIgnoreCase("index")){
				session.setAttribute("lang", lang);
				 response.sendRedirect("Index.jsp");
				 
			}
			
			else if(action.equalsIgnoreCase("product")){
				  String cate_id =  request.getParameter("cate_id");
				session.setAttribute("lang", lang);
				
				 response.sendRedirect("ProductServlet?action=products&cate_id="+cate_id);
			}
			else if(action.equalsIgnoreCase("single")){
				 String pr_id =  request.getParameter("pr_id");
				session.setAttribute("lang", lang);
				 response.sendRedirect("ProductServlet?action=single&pr_id="+pr_id);
				
			}
			
			else if(action.equalsIgnoreCase("productall")){
			
				session.setAttribute("lang", lang);
				 response.sendRedirect("Productall.jsp");
				
			}
			
			else if(action.equalsIgnoreCase("register")){
				
				session.setAttribute("lang", lang);
				 response.sendRedirect("register.jsp");
				
			}
			
	     else if(action.equalsIgnoreCase("checkout")){
				
				session.setAttribute("lang", lang);
				 response.sendRedirect("checkout.jsp");
				
			}
		
		
				
				
			
			
	}

}
