/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.BlogFacade;

/**
 *
 * @author thao
 */
@WebServlet(name = "BlogServlet", urlPatterns = {"/blog"})
public class BlogServlet extends HttpServlet {
    
    private static final Logger LOG = Logger.getLogger(BlogServlet.class.getName());
    private static final long serialVersionUID = 590L;
    
    @EJB
    BlogFacade blogFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.info("get /blog");
        
        String idDelete = req.getParameter("delete");
        if (idDelete != null) {
            blogFacade.remove(blogFacade.find(Integer.valueOf(idDelete)));
            resp.sendRedirect(req.getContextPath() + "/blog");
            return;
        }
        req.setAttribute("listBlog", blogFacade.findAll());
        req.getRequestDispatcher("/WEB-INF/admin/blog/blog_list.jsp").include(req, resp);
        
        
    }
    

   
}
