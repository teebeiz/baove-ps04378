package Controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import Help.PasswordEncryption;
import Model.Account;
import DAO.*;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("createacount")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String conpassword = request.getParameter("conpassword");
            PrintWriter out = response.getWriter();
            String err = "";
            String success = "";

            if (!password.equals(conpassword)) {
                err += " Bạn Nhập Password Không Đúng ";
            } else if (checkemail(email)) {
                err += " Email Đã Tồn Tại";
            }
            if (!checkemailss(email)) {
                err += " Bạn Nhập Email Không Hợp Lệ ";
            }
            if (checkpassword(password)) {
                err += " Bạn Nhập Password Không hợp lệ ";
            }

            if (err.length() > 0) {

                out.println(err);
            }

            if (err.length() == 0) {
                Account ac = new Account();
                ac.setEmail(email);
                ac.setHoten(name);
                ac.setPassword(PasswordEncryption.MD5(conpassword));
                Accoundao acd = new Accoundao();
                acd.createaccount(ac);
                success = "Account Create Success ,Please Login";

                out.print(success);

            }

        } else if (action.equalsIgnoreCase("login")) {
            String email = request.getParameter("emails");
            String password = request.getParameter("passwords");
            HttpSession session = request.getSession();
            Accoundao acd = new Accoundao();
            Account ac = acd.checlogin(email, PasswordEncryption.MD5(password));
            String err;
            if (email.isEmpty()) {
                err = "Bạn chưa nhập Email";
                try {
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("account.jsp").forward(request, response);
                } catch (Exception e) {
                    // TODO: handle exception
                }

            } else if (password.isEmpty()) {

                try {
                    err = "Bạn chưa nhập Password";
                    check(request, response, err);
                } catch (Exception e) {
                    // TODO: handle exception
                }
            } else if (ac == null) {
                try {
                    err = "Email hoặc Password Không đúng!";
                    check(request, response, err);
                } catch (Exception e) {
                    // TODO: handle exception
                }

            } 
          else if (!email.equals("admin@fpt.edu.vn") && ac != null) {
               session.setAttribute("email", email);
             response.sendRedirect("Index.jsp");
          }
            else if(email.equals("admin@fpt.edu.vn")&&password.equals("admin")){
                session.setAttribute("email", email);
                response.sendRedirect("indexadmin.jsp");
            }
        }

    }

    public void check(HttpServletRequest request, HttpServletResponse response, String err) throws Exception {

        request.setAttribute("err", err);

        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    public boolean checkemail(String email) {
        Accoundao acd = new Accoundao();
        for (Account ac : acd.findll()) {
            if (ac.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }

        return false;
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

    public boolean checkpassword(String n) {
        Pattern pt1 = Pattern.compile("[^a-z,0-9]", Pattern.CASE_INSENSITIVE);
        Matcher mt1 = pt1.matcher(n);
        if (mt1.find()) {
            return true;
        } else {
            return false;
        }
    }

}
