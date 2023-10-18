
package testWeb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.RegisterDAO;
import testWeb.dao.impl.RegisterDAOImpl;
import testWeb.vo.UserInfo;

public class UserRegisterServlet extends HttpServlet
{

    public UserRegisterServlet()
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
        RegisterDAO dao1 = new RegisterDAOImpl();
        int success = 0;
        try
        {
            success = dao1.addUserInfo(userinfo);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        if(success == 1)
            res.sendRedirect("./login.jsp");
        else
            res.sendRedirect("./register.jsp");
    }

    private static final long serialVersionUID = 1L;
}
