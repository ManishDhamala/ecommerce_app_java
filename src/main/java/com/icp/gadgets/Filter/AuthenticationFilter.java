package com.icp.gadgets.Filter;

import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter",urlPatterns = {"/cart"})
public class AuthenticationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
        HttpSession session = httpReq.getSession(false);
        if(session == null || session.getAttribute("userId") == null){
            httpResp.sendRedirect(httpReq.getContextPath()+"/pages/login.jsp"+ StringUtils.ERROR_MESSAGE+"=login");
        }else {
            chain.doFilter(request, response);
        }

    }
}