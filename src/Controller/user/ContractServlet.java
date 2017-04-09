package Controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ContractDao;
import Model.Contract;

/**
 * Servlet implementation class ContractServlet
 */
@WebServlet("/ContractServlet")
public class ContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContractDao condao = new ContractDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContractServlet() {
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

		
		if (action.equalsIgnoreCase("sends")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String message = request.getParameter("message");
		
	
			if(!checkemailss(email)){
				out.print("Bạn nhập Email không đúng!s");
			}
			
			else{
				Contract con = new Contract();
				con.setName(name);
				con.setEmail(email);
				con.setPhone(phone);
				con.setMessage(message);
				condao.createcontract(con);
				out.print(" Gữi thành công chúng tôi sẽ liên hệ với bạn!");
			}
	

		}
	}

	public boolean checkemailss(String n) {
		Pattern pt1 = Pattern.compile("\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b", Pattern.CASE_INSENSITIVE);
		Matcher mt1 = pt1.matcher(n);
		if (mt1.find()) {
			return true;
		} else {
			return false;
		}

	}

}
