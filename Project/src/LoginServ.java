
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

public class LoginServ extends HttpServlet 
{
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PrintWriter pw=null;
		String path= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "root";
		String sql = "select * from user_info where username = ? and password = ?";
		
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
		public void doPost(HttpServletRequest req, HttpServletResponse res)
		{
			try
			{
				String username;
				String password;
				username=req.getParameter("reg");
				password=req.getParameter("pass");
				stmt=con.prepareStatement(sql);
				stmt.setString(1,username);
				stmt.setString(2,password);
				rs=stmt.executeQuery();
				pw=res.getWriter();
				if(rs.next()==true)
				{	
					HttpSession hs=req.getSession();
					hs.setAttribute("user", username);
					if(username.equals("admin"))
					{
						res.sendRedirect("admin.jsp");
					}
					else
					{
					res.sendRedirect("/Project/home.jsp");
					}
				}
				else
				{
					res.sendRedirect("/Project/InvalidReg.jsp");
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		public void destroy()
		{
			try{
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