
package testWeb.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.UserDAO;
import testWeb.dao.impl.UserDAOImpl;

public class UserServlet extends HttpServlet
{
    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        doPost(httpservletrequest, httpservletresponse);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        String username = (String)req.getSession().getAttribute("username");
        UserDAO dao = new UserDAOImpl();
        try
        {
            testWeb.vo.User user = dao.getUserInfoByUsername(username);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/account.jsp").forward(req, res);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
