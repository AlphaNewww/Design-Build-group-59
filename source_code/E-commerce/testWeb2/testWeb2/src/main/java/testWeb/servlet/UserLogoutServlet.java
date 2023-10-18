
package testWeb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UserLogoutServlet extends HttpServlet
{

    public UserLogoutServlet()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        req.getSession().removeAttribute("username");
        res.sendRedirect("./login.jsp");
    }
}
