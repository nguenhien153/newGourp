/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.fillter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem4.jee.g01jewelap.dto.AccountInfo;

/**
 *
 * @author nguen
 */
@WebFilter("/manager/*")
public class AuthorFillter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String splitUri = uri.substring(11);
        if (splitUri.startsWith("/manager")) {
            HttpSession session = req.getSession();
            AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
            if (accountInfo == null) {
                resp.sendRedirect(req.getContextPath() + "/login-manager");
            } else {
                if (accountInfo.getRole().contains("support") || accountInfo.getRole().contains("admin")) {
                    chain.doFilter(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/login-manager");
                }
            }
        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
