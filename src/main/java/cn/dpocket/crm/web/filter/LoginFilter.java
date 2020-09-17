package cn.dpocket.crm.web.filter;


import cn.dpocket.crm.settings.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * ClassName:LoginFilter
 * Package:cn.dpocket.crm.web.filter
 * Description:
 * Date:2020/9/15 14:56
 * Author: anson
 */
public class LoginFilter implements Filter{

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        String path = request.getServletPath();
        if("/login.jsp".equals(path) || "/settings/user/login.do".equals(path)){
            chain.doFilter(req, resp);
        }else{
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            if(user != null){
                chain.doFilter(req, resp);
            }else{
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        }

    }

    public void destroy() {

    }
}
