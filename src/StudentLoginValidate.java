

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentLoginValidate")
public class StudentLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
			try {  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback?verifyServerCertificate=false&useSSL=true&requireSSL=true","root","root");
				PreparedStatement login = con.prepareStatement("select department from users where userName = ? and password = ? ");
				login.setString(1, email);
				login.setString(2, password);
				ResultSet rs = login.executeQuery();
				if(rs.next()) {
					request.setAttribute("department", rs.getString("department"));
					RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback");
					rd.forward(request,  response);
				} else {
					request.setAttribute("error", "Check the login credentials and try again.");
					RequestDispatcher rd = request.getRequestDispatcher("/studentLogin.jsp");
					rd.include(request,  response);
				}
				con.close();
			}
			catch (Exception e1) {
					System.out.print(e1);
			}
		}
	}
