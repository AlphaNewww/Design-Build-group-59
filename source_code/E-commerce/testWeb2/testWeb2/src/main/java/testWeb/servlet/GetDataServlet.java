
package testWeb.servlet;

import testWeb.dao.GetDataDAO;
import testWeb.dao.RobotDao;
import testWeb.dao.UserDAO;
import testWeb.dao.impl.GetDataDAOImpl;
import testWeb.dao.impl.RobotDaoImpl;
import testWeb.dao.impl.UserDAOImpl;
import testWeb.vo.Data;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GetDataServlet extends HttpServlet
{
    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        List<Data> dataList;
        int robotid = Integer.parseInt(httpservletrequest.getParameter("robotid"));
        GetDataDAO dao = new GetDataDAOImpl();
        try {
            dataList = dao.getDataByRobotId(robotid);

            // 使用 Jackson 将 dataList 转换为 JSON 格式
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(dataList);

            // 设置响应内容类型为 JSON
            httpservletresponse.setContentType("application/json");

            // 将 JSON 响应发送回客户端
            httpservletresponse.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
            // 处理异常并返回适当的错误响应
            httpservletresponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
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
