
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class CategoryName extends HttpServlet 
{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PrintWriter pw=null;
		String path= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "root";
		String sql = "select category_name from category";
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
				stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				pw=res.getWriter();
				pw.println("<b>Category names :-</b>");
				pw.println("<br><br>");
				while(rs.next()==true)
				{
				String a=rs.getString(1);
				pw.println("<b>"+a+",</b>");
				}
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
