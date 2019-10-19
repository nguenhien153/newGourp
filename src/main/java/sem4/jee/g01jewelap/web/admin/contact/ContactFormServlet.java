/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.ContactFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Contact;
import sem4.jee.g01jewelap.util.MailUtil;

/**
 *
 * @author thao
 */
@WebServlet(name = "ContactFormServlet", urlPatterns = {"/contactForm"})
public class ContactFormServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(ContactFormServlet.class.getName());
    private static final long serialVersionUID = 550L; //moi~ servlet thay doi so private static final long serialVersionUID = 2L
//bat dau tu so 5

    @EJB
    ContactFacade contactFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Contact form = new Contact();

        if (id == null) {
            req.setAttribute("form", form);
        } else {
            req.setAttribute("form", contactFacade.find(Integer.valueOf(id)));
        }
//          req.setAttribute("listProduct", productFacade.findAll()); 
        req.getRequestDispatcher("/WEB-INF/admin/contact_form.jsp").include(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String title = req.getParameter("title");
        String question = req.getParameter("question");
        String answer = req.getParameter("answer");

        Contact form = new Contact();
        form.setName(name);
        form.setEmail(email);
        form.setTitle(title);
        form.setQuestion(question);
        form.setAnswer(answer);

        Date now = new Date();
        form.setDateCreated(now);
        form.setDateModify(now);

        // validate later
        try {
            if (id == null) {
                contactFacade.create(form);
            } else {
                form.setId(Integer.valueOf(id));
                contactFacade.edit(form);
            }
            //SEND EMAIL    
            Cookie emailCookie = new Cookie("emailCookie", form.getEmail());
            emailCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
            emailCookie.setPath("/");
            resp.addCookie(emailCookie);

            // send email
            MailUtil.sendEmail(getServletContext(), form.getEmail(),
                    form.getName());
            resp.sendRedirect(getServletContext().getContextPath() + "/contact");
        } catch (Exception ex) {
            LOG.info("Error save contact");
            req.setAttribute("form", form);
            req.setAttribute("msgError", ex.getMessage());
            req.getRequestDispatcher("/WEB-INF/admin/contact/contact_form.jsp").include(req, resp);

        }
    }

}
