

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

import bean.Faculty;;

@WebServlet("/GiveFeedback")
public class FacultyDropdown extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = (String) request.getAttribute("department");
		Faculty[] facultyList = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			boolean status = false;
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback?verifyServerCertificate=false&useSSL=true&requireSSL=true","root","root");
			PreparedStatement fetchFaculty = con.prepareStatement("select name, email from faculty where department = ? ");
			fetchFaculty.setString(1, department);
			ResultSet rs = fetchFaculty.executeQuery();
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
			facultyList = new Faculty[size+1];
			if(status) {
				facultyList[index++] = new Faculty("Choose a faculty",null);
				while(rs.next()) {
					facultyList[index++] = new Faculty(rs.getString("name"),rs.getString("email"));
				}
			} else {
				facultyList[index++] = new Faculty("No faculty found",null);
			}
			request.setAttribute("facultyList", facultyList);
			String success = (String) request.getAttribute("success");
			if(success != null) {
				request.setAttribute("success",success);
			}
			String error = (String) request.getAttribute("error");
			if(error != null) {
				request.setAttribute("error",error);
			}
			request.setAttribute("department",department);
			RequestDispatcher rd = request.getRequestDispatcher("/sendFeedback.jsp");
			rd.forward(request, response);
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
