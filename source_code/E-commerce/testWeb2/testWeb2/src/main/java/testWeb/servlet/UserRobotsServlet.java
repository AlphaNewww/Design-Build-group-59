
package testWeb.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.RobotDao;
import testWeb.dao.impl.RobotDaoImpl;

public class UserRobotsServlet extends HttpServlet
{

    public UserRobotsServlet()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        String username = (String)req.getSession().getAttribute("username");
        List robots = new ArrayList();
        RobotDao dao = new RobotDaoImpl();
        try
        {
            robots = dao.getRobotsByUsername(username);
            req.setAttribute("robots", robots);
            req.getRequestDispatcher("/robots.jsp").forward(req, res);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
