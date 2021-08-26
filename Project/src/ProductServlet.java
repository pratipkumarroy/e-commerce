
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductServlet extends HttpServlet 
{
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PrintWriter pw=null;
		String path= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "system";
		String password = "root";
		String sql = "Insert into product values (?,?,?,?)";
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
				String p_name=req.getParameter("prod_name");
				String p_price=req.getParameter("prod_price");
				String p_desc=req.getParameter("prod_desc");
				Part file=req.getPart("p_img");
				
				String name=file.getSubmittedFileName();
				System.out.println(name);
				
				String uploadpath="C:/Users/prati/workspace/Project/WebContent/img/"+name;
				System.out.println(uploadpath);
				
				stmt=con.prepareStatement(sql);
				stmt.setString(1,p_name);
				stmt.setString(2,p_price);
				stmt.setString(3,p_desc);
				stmt.setString(4,name);
				rs=stmt.executeQuery();
				pw=res.getWriter();
				
				FileOutputStream fos=new FileOutputStream(uploadpath);
				InputStream is=file.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				is.close();   
				
				res.sendRedirect("/Project/admin.jsp");
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
