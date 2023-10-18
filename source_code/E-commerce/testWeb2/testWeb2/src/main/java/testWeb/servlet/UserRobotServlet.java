
package testWeb.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.RobotDao;
import testWeb.dao.impl.RobotDaoImpl;
import testWeb.vo.Robot;

public class UserRobotServlet extends HttpServlet
{

    public UserRobotServlet()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        int robotid = Integer.parseInt(req.getParameter("robotid"));
        Robot robot = new Robot();
        RobotDao dao = new RobotDaoImpl();
        try
        {
            robot = dao.getRobotByRobotId(robotid);
            req.setAttribute("robot", robot);
            req.getRequestDispatcher("/robot.jsp").forward(req, res);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
