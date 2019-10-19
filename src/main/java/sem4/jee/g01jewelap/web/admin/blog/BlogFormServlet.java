/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.blog;

import com.fasterxml.jackson.databind.ObjectMapper;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sem4.jee.g01jewelap.ejb.BlogFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Blog; 

/**
 *
 * @author thao
 */
@WebServlet(name = "BlogFormServlet", urlPatterns = {"/blogForm"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,//10MB
                maxFileSize = 1024 * 1024 * 50, //50 MB
                maxRequestSize = 1024 * 1024 * 100 ) //100MB
public class BlogFormServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(BlogFormServlet.class.getName());
    private static final long serialVersionUID = 560L; //moi~ servlet thay doi so private static final long serialVersionUID = 2L
//bat dau tu so 5
    SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
    @EJB
    BlogFacade blogFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Blog form = new Blog();

        if (id == null) {
            req.setAttribute("form", form);
        } else {
            req.setAttribute("form", blogFacade.find(Integer.valueOf(id)));
        }
//          req.setAttribute("listProduct", productFacade.findAll()); 
        req.getRequestDispatcher("/WEB-INF/admin/blog_form.jsp").include(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
                
                
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content"); 
        String imageUrl = req.getParameter("imageUrl");
        String createdby = req.getParameter("createdby");
        
        

        Blog form = new Blog();
            form.setTitle(title);
            form.setContent(content);
            form.setImageUrl(imageUrl);
            form.setCreatedby(createdby); 
            
            Date now = new Date();
            form.setDateCreated(now); 
            
            
        // validate later
        try {
            if (id == null) {
                 
                blogFacade.create(form);
            } else {
                form.setId(Integer.valueOf(id));
                blogFacade.edit(form);
            }
            resp.sendRedirect(getServletContext().getContextPath() + "/blog");
            mapper.writeValue(resp.getOutputStream(), form);
        } catch (Exception ex) {
            LOG.info("Error save blog");
            req.setAttribute("form", form);
            req.setAttribute("msgError", ex.getMessage());
            req.getRequestDispatcher("/WEB-INF/admin/blog/blog_form.jsp").include(req, resp);

        }
    }

}
