/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.client.account;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem4.jee.g01jewelap.dto.AccountInfo;
import sem4.jee.g01jewelap.ejb.AccountFacade;
import sem4.jee.g01jewelap.entity.mysql.Account;
import sem4.jee.g01jewelap.entity.mysql.AccountRole;

/**
 *
 * @author nguen
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/logout"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 63L;
    @EJB
    private AccountFacade accountFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();

        if (uri.endsWith("/login")) {
            req.getRequestDispatcher("/WEB-INF/client/account/login.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.removeAttribute("accountInfo");
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("accountInfo") == null) {
            String gmail = req.getParameter("gmail");
            String password = req.getParameter("password");
            Account account = accountFacade.findByGmailAndPassword(gmail, password);
            if (account == null) {
                resp.sendRedirect(req.getContextPath() + "/login?incorrect");
            } else {
                List<String> role = new ArrayList<>();
                boolean check = false;
                for (AccountRole item : account.getAccountRoleList()) {
                    role.add(item.getRoleName().getName());
                    if (item.getRoleName().getName().equals("member")) {
                        check = true;
                    }
                }
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setRole(role);
                accountInfo.setFullName(account.getFullName());
                accountInfo.setUserID(account.getAccountId());
                accountInfo.setGmail(account.getGmail());

                if (check) {
                    session.setAttribute("accountInfo", accountInfo);
                    resp.sendRedirect(req.getContextPath() + "/home");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/login?NotMemberRole");
                }
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");  
        }

    }

}
