

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


@WebServlet("/FetchFeedback")
public class FetchFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String[] feedbacks = null;
		String email = (String) request.getAttribute("email");
		String facultyName = (String) request.getAttribute("facultyName");
			try {
				Class.forName("com.mysql.jdbc.Driver"); 
				boolean status = false;
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback?verifyServerCertificate=false&useSSL=true&requireSSL=true","root","root");
				PreparedStatement fetchFeedback = con.prepareStatement("select feedback from feedback where facultyEmail = ? ");
				fetchFeedback.setString(1, email);
				ResultSet rs = fetchFeedback.executeQuery();
				status = rs.next();
				rs.beforeFirst();
				int size = 0;
				int index = 0;
				if (rs != null) 
				{
					rs.last();
					size = rs.getRow();
					rs.beforeFirst();
				}
				feedbacks = new String[size];
				if(status) {
					while(rs.next()) {
						feedbacks[index++] = rs.getString("feedback");
					}
				}
				request.setAttribute("feedbacks", feedbacks);
				request.setAttribute("name",facultyName);
				RequestDispatcher rd = request.getRequestDispatcher("/viewFeedback.jsp");
				rd.forward(request, response);
				con.close();
			}
			catch (Exception e1) {
					System.out.print(e1);
			}
	}

}
