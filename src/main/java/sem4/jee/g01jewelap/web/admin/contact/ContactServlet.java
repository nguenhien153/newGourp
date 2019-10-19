/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.ContactFacade;

/**
 *
 * @author thao
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {
    
    private static final Logger LOG = Logger.getLogger(ContactServlet.class.getName());
    private static final long serialVersionUID = 589L;
    
    @EJB
    ContactFacade contactFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.info("get /contact");
        
        String idDelete = req.getParameter("delete");
        if (idDelete != null) {
            contactFacade.remove(contactFacade.find(Integer.valueOf(idDelete)));
            resp.sendRedirect(req.getContextPath() + "/contact");
            return;
        }
        req.setAttribute("listContact", contactFacade.findAll());
        req.getRequestDispatcher("/WEB-INF/admin/contact_list.jsp").include(req, resp);
        
        
    }
    

   
}
