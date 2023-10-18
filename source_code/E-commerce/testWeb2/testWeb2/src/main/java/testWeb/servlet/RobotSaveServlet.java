
package testWeb.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import testWeb.dao.RobotDao;
import testWeb.dao.impl.RobotDaoImpl;
import testWeb.vo.Robot;

@MultipartConfig
public class RobotSaveServlet extends HttpServlet
{

    public RobotSaveServlet()
    {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        Part imagePart = req.getPart("robotImage");
        String model = req.getParameter("model");
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        String robotIdStr = req.getParameter("robotId");
        int robotId = Integer.parseInt(robotIdStr);
        String savePath = null;
        String savePath0 = null;
        String username = (String)req.getSession().getAttribute("username");

        ServletContext context = getServletContext();
        String directoryPath = context.getRealPath("/robotimg");
        File directory = new File(directoryPath);
        boolean flag;
        if(!directory.exists())
            flag = directory.mkdirs();
        String fileName = (new StringBuilder()).append(robotId).append("_").append(System.currentTimeMillis()).append("_").append(getSubmittedFileName(imagePart)).toString();
        savePath0 = (new StringBuilder("/robotimg/")).append(fileName).toString();
        savePath = getServletContext().getRealPath(savePath0);
        InputStream input = imagePart.getInputStream();
        OutputStream output = new FileOutputStream(savePath);
        byte buffer[] = new byte[1024];
        int length;
        while((length = input.read(buffer)) > 0) 
            output.write(buffer, 0, length);
        Robot robot;
        RobotDao dao = new RobotDaoImpl();
        try
        {
            robot = dao.saveRobotByRobotId(robotId, model, color, size, savePath0);
            req.setAttribute("robot", robot);
            req.getRequestDispatcher("/robot.jsp").forward(req, res);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return;
    }

    private String getSubmittedFileName(Part part)
    {
        String contentDisposition = part.getHeader("content-disposition");
        if(contentDisposition != null)
        {
            String tokens[] = contentDisposition.split(";");
            String as[];
            int j = (as = tokens).length;
            for(int i = 0; i < j; i++)
            {
                String token = as[i];
                if(token.trim().startsWith("filename"))
                    return token.substring(token.indexOf("=") + 1).trim().replace("\"", "");
            }

        }
        return null;
    }
}
