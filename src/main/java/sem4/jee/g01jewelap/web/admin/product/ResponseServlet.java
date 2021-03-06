/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.ReviewFacade;

/**
 *
 * @author thao
 */
@WebServlet(name = "ResponseServlet", urlPatterns = {"/response"})
public class ResponseServlet extends HttpServlet {
    
    private static final Logger LOG = Logger.getLogger(ResponseServlet.class.getName());
    private static final long serialVersionUID = 102L;
    
    @EJB
    ReviewFacade reviewFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.info("get /response");
        
        String idDelete = req.getParameter("delete");
        if (idDelete != null) {
            reviewFacade.remove(reviewFacade.find(Integer.valueOf(idDelete)));
            resp.sendRedirect(req.getContextPath() + "/response");
            return;
        }
        req.setAttribute("listResponse", reviewFacade.findAll());
        req.getRequestDispatcher("/WEB-INF/admin/response_list.jsp").include(req, resp);
        
        
    }
    

   
}
