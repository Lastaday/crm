package cn.dpocket.crm.web.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * ClassName:EncodingFilter
 * Package:cn.dpocket.crm.web.filter
 * Description:
 * Date:2020/9/7 17:04
 * Author: anson
 */
public class EncodingFilter implements Filter{
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        chain.doFilter(req, resp);
    }

    public void destroy() {

    }
}
