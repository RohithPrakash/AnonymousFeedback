

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SubmitFeedback")
public class SubmitFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String feedback = request.getParameter("feedback");
		String facultyEmail = request.getParameter("faculty");
		String department = request.getParameter("department");
		int status;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback?verifyServerCertificate=false&useSSL=true&requireSSL=true","root","root");
				PreparedStatement storeFeedback = con.prepareStatement("insert into feedback(feedback, facultyEmail)" + "values (?, ?)");
				storeFeedback.setString(1, feedback);
				storeFeedback.setString(2, facultyEmail);
				status = storeFeedback.executeUpdate();
				if(status > 0) {
					request.setAttribute("success", "Feedback submitted!");
					request.setAttribute("department", department);
					RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback");
					rd.forward(request,  response);
				} else {
					request.setAttribute("error", "Could not submit feedback. Try again.");
					request.setAttribute("department", department);
					RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback");
					rd.forward(request,  response);
				}
				con.close();
			}
			catch (Exception e1) {
				System.out.println(e1);
			}
	}

}
