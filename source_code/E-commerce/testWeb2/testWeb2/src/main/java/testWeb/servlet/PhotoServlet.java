
package testWeb.servlet;

import java.io.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class PhotoServlet extends HttpServlet
{

    public PhotoServlet()
    {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws IOException, ServletException
    {
        File file;
        Exception exception;
        String imagePath = getServletContext().getRealPath("/robotphoto/");
        String requestedFile = req.getPathInfo();
        String filePath = (new File(imagePath, requestedFile)).getPath();
        filePath = filePath.substring(0, filePath.length() - 6);
        file = new File(filePath);
        res.setHeader("Content-Type", getServletContext().getMimeType(requestedFile));
        res.setHeader("Content-Length", String.valueOf(file.length()));
        exception = null;
        Object obj = null;
        InputStream inputStream = new FileInputStream(file);
        OutputStream outputStream = res.getOutputStream();
        byte buffer[] = new byte[4096];
        int bytesRead;
        while((bytesRead = inputStream.read(buffer)) != -1) 
            outputStream.write(buffer, 0, bytesRead);
    }
}
