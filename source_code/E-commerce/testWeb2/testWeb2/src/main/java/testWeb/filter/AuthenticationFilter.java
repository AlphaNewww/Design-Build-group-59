
package testWeb.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthenticationFilter
    implements Filter
{

    public AuthenticationFilter()
    {
    }

    public void init(FilterConfig filterconfig)
        throws ServletException
    {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException
    {
        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpResponse = (HttpServletResponse)response;
        HttpSession session = httpRequest.getSession(false);
        String url = httpRequest.getRequestURI();
        if(!url.endsWith("login") && !url.endsWith("login.jsp") && !url.endsWith("register") && !url.endsWith("register.jsp") && (session == null || session.getAttribute("username") == null))
            httpResponse.sendRedirect("login.jsp");
        else
            chain.doFilter(request, response);
    }

    public void destroy()
    {
    }
}
