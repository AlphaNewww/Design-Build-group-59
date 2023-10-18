
package testWeb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.UserDAO;
import testWeb.dao.impl.UserDAOImpl;
import testWeb.vo.UserInfo;

public class UserLoginServlet extends HttpServlet
{

    public UserLoginServlet()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        UserInfo userinfo = new UserInfo();
        userinfo.setUsername(req.getParameter("username"));
        userinfo.setPassword(req.getParameter("password"));
        UserDAO dao = new UserDAOImpl();
        int flag = 0;
        try
        {
            flag = dao.queryByUserInfo(userinfo);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        if(flag == 1)
        {
            HttpSession session = req.getSession();
            session.setAttribute("username", userinfo.getUsername());
            res.sendRedirect("./index.jsp");
        } else
        {
            res.sendRedirect("./error.jsp");
        }
    }
}
