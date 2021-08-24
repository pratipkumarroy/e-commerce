import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServ extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	{
		try 
		{
			HttpSession hs=req.getSession();
			hs.removeAttribute("user");
			hs.invalidate();
			res.sendRedirect("login.jsp");
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
}