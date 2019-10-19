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
import sem4.jee.g01jewelap.ejb.*;

/**
 *
 * @author thao
 */
@WebServlet(name = "DiscountServlet", urlPatterns = {"/discount"})
public class DiscountServlet extends HttpServlet {
    
    private static final Logger LOG = Logger.getLogger(DiscountServlet.class.getName());
    private static final long serialVersionUID = 102L;
    
    @EJB
    DiscountFacade discountFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.info("get /discount");
        
        String idDelete = req.getParameter("delete");
        if (idDelete != null) {
            discountFacade.remove(discountFacade.find(Integer.valueOf(idDelete)));
            resp.sendRedirect(req.getContextPath() + "/discount");
            return;
        }
        req.setAttribute("listDiscount", discountFacade.findAll());
        req.getRequestDispatcher("/WEB-INF/admin/product/discount_list.jsp").include(req, resp);
        
        
    }
    

   
}
