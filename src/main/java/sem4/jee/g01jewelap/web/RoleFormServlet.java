/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.RoleFacade;
import sem4.jee.g01jewelap.entity.Role;

/**
 *
 * @author thao
 */
@WebServlet(name = "RoleFormServlet", urlPatterns = {"/RoleFormServlet"})
public class RoleFormServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(RoleFormServlet.class.getName());
    private static final long serialVersionUID = 2L;
    
    @EJB
    RoleFacade roleFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Role form = new Role();
        if (id == null){
            req.setAttribute("form", form);
        } else {
            req.setAttribute("form", roleFacade.find(Integer.valueOf(id)));
        }
        req.getRequestDispatcher("/WEB-INF/admin/role_form.jsp").include(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        Role form = new Role();
        
        form.setRoleName(name);
        
        // validate later
        
        try {
            if (id == null){
                roleFacade.create(form);
            } else {
                form.setId(Integer.valueOf(id));
                roleFacade.edit(form);
            }
            resp.sendRedirect(req.getContextPath() + "/RoleServlet");
        } catch (Exception ex) {
            LOG.info("Error save role");
            req.setAttribute("form", form);
            req.setAttribute("errMsg", ex.getMessage());
            req.getRequestDispatcher("/WEB-INF/admin/role_form.jsp").include(req, resp);
        }
           
    }

}
