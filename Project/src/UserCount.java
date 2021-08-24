

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserCount extends HttpServlet 
{
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PrintWriter pw=null;
		String path= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "root";
		String sql = "select count(*) from user_info";
		
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
				stmt=con.prepareStatement(sql);
				rs=stmt.executeQuery();
				pw=res.getWriter();
				rs.next();
				String a=rs.getString(1);
				
				RequestDispatcher rd;
				req.setAttribute("u_count", a);
				rd=req.getRequestDispatcher("admin.jsp"); 
				req.getServletContext().getRequestDispatcher("/CategoryCount").include(req, res);
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