/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.account;

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
@WebServlet(name = "LoginManagerServlet", urlPatterns = {"/login-manager", "/logout-manager"})
public class LoginManagerServlet extends HttpServlet {

    private static final long serialVersionUID = 65L;
    @EJB
    private AccountFacade accountFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String uri = req.getRequestURI();
        if (uri.endsWith("/login-manager")) {
            if (session.getAttribute("accountInfo") != null) {
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                if (accountInfo.getRole().contains("support") || accountInfo.getRole().contains("admin")) {
                    resp.sendRedirect(req.getContextPath() + "/manager/home");
                }
            }
            req.getRequestDispatcher("/WEB-INF/admin/account/login-manager.jsp").forward(req, resp);

        } else {
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
                resp.sendRedirect(req.getContextPath() + "/login-manager?incorrect");
            } else {
                List<String> role = new ArrayList<>();
                boolean check = false;
                for (AccountRole item : account.getAccountRoleList()) {
                    role.add(item.getRoleName().getName());
                    if (item.getRoleName().getName().equals("admin")
                            || item.getRoleName().getName().equals("support")) {
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
                    resp.sendRedirect(req.getContextPath() + "/manager/home");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/login-manager?NotMemberRole");
                }
            }
        } else {
            AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
            if (accountInfo.getRole().contains("support") || accountInfo.getRole().contains("admin")) {
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            }
            resp.sendRedirect(req.getContextPath() + "/login-manager");
        }
    }
}
