
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registration extends HttpServlet 
{
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PrintWriter pw=null;
		String path= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "root";
		String sql = "Insert into user_info values (?,?,?)";
		public void init()
		{
			try
			{
				Class.forName(path);
				con = DriverManager.getConnection(url, user, password);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		protected void doPost(HttpServletRequest req, HttpServletResponse res)
		{
			try
			{
				String username;
				String password;
				String email;
				username=req.getParameter("reg");
				password=req.getParameter("pass");
				email=req.getParameter("email");
				stmt=con.prepareStatement(sql);
				stmt.setString(1,username);
				stmt.setString(2,password);
				stmt.setString(3,email);
				rs=stmt.executeQuery();
				pw=res.getWriter();
				res.sendRedirect("/Project/success.jsp");
			}
			catch (Exception e)
			{
				try {
					res.sendRedirect("/Project/failure.jsp");
				} 
				catch (IOException e1) 
				{
					e1.printStackTrace();
				}
			}
		}
		public void destroy()
		{
			try
			{
				con.close();
				stmt.close();
				pw.close();
				rs.close();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		}