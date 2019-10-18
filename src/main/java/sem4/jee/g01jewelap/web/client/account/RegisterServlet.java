/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.client.account;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.entity.mysql.Account;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.ejb.EJB;
import sem4.jee.g01jewelap.ejb.AccountFacade;
import sem4.jee.g01jewelap.ejb.AccountRoleFacade;
import sem4.jee.g01jewelap.ejb.RoleFacade;
import sem4.jee.g01jewelap.entity.mysql.AccountRole;
import sem4.jee.g01jewelap.entity.mysql.Role;

/**
 *
 * @author nguen
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    
    @EJB
    private RoleFacade roleFacade;
    
    @EJB
    private AccountRoleFacade accountRoleFacade;
    
    @EJB
    private AccountFacade accountFacade;
    
    private static final long serialVersionUID = 64L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/client/account/register.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Account account = new Account();
        account.setGmail(req.getParameter("gmail"));
        account.setPassword(req.getParameter("password"));
        account.setFullName(req.getParameter("fullName"));
        account.setPhone(Integer.valueOf(req.getParameter("phone")));
        account.setGender(req.getParameter("gender").equals("female"));

        //  AccountRole accountRole = new AccountRole();
        try {
            account.setDob(sdf.parse(req.getParameter("dob")));
            String datee = sdf.format(new Date());
            account.setDateCreate(sdf.parse(datee));
            account.setCreateBy(account.getFullName());
            account.setStatus("new");
            
            if (validateAccount(account, req)) {
                
                accountFacade.create(account);
                
                Role role = roleFacade.findByRoleName("member");
                AccountRole accountRole = new AccountRole();
                accountRole.setAccountName(account);
                accountRole.setDateCreate(sdf.parse(datee));
                accountRole.setCreateBy(account.getFullName());
                accountRole.setRoleName(role);
                accountRoleFacade.create(accountRole);
                
                resp.sendRedirect(req.getContextPath() + "/register?success");
            } else {
                req.setAttribute("account", account);
                req.getRequestDispatcher("/WEB-INF/client/account/register.jsp").forward(req, resp);
            }
        } catch (ParseException | IOException | ServletException ex) {
            req.setAttribute("parseDateFalse", "System Error. Please trying later !!!");
            req.setAttribute("dobb", req.getParameter("dob"));
            req.setAttribute("account", account);
            req.getRequestDispatcher("/WEB-INF/client/account/register.jsp").forward(req, resp);
        }
    }
    
    private boolean validateAccount(Account account, HttpServletRequest req) {
        String regexGmail = "^[a-z][a-z0-9_\\.]{5,30}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$";
        String regexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
        String regexFullName = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
        
        Pattern gmail = Pattern.compile(regexGmail);
        Matcher m_gmail = gmail.matcher(account.getGmail());
        boolean check = true;
        if (account.getGmail() == null || account.getGmail().length() > 40 || m_gmail.find() == false) {
            req.setAttribute("gmailError", "Gmail not valid");
            check = false;
        }
        
        Pattern pass = Pattern.compile(regexPassword);
        Matcher m_pass = pass.matcher(account.getPassword());
        if (account.getPassword() == null || account.getPassword().length() > 50 || m_pass.find() == false) {
            req.setAttribute("passwordError", "Password must have minimum eight characters, At least one letter and one number");
            check = false;
        }
        
        Pattern fullname = Pattern.compile(regexFullName);
        Matcher m_name = fullname.matcher(account.getFullName());
        if (account.getFullName() == null || account.getFullName().length() > 50 || m_name.find() == false) {
            req.setAttribute("fullnameError", "Full name not valid");
            check = false;
        }
        Date date = new Date();
        if (account.getDob().getYear() > date.getYear()) {
            req.setAttribute("dobError", "Date of Birth not valid");
            check = false;
        }
        if (account.getPassword().equals(req.getParameter("confirm")) == false) {
            req.setAttribute("confirmError", "Password does not match with Confim Password");
            check = false;
        }
        return check;
    }
    
}
