
package testWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import testWeb.dao.UserDAO;
import testWeb.dao.impl.UserDAOImpl;
import testWeb.vo.User;

public class UserChangeServlet extends HttpServlet
{

    public UserChangeServlet()
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
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel");
        UserDAO dao = new UserDAOImpl();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setTel(tel);
        try
        {
            user = dao.changeUserByUsername(user);
            PrintWriter out = res.getWriter();
            req.setAttribute("user", user);
            out.println("<script>");
            out.println("alert('\u4FDD\u5B58\u6210\u529F');");
            out.println("</script>");
            req.getRequestDispatcher("/account.jsp").forward(req, res);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
