/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.DiscountFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Discount;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author thao
 */
@WebServlet(name = "DiscountFormServlet", urlPatterns = {"/discountForm"})
public class DiscountFormServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(DiscountFormServlet.class.getName());
    private static final long serialVersionUID = 503L; //moi~ servlet thay doi so private static final long serialVersionUID = 2L
//bat dau tu so 5
    SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
    @EJB
    DiscountFacade discountFacade;
    
    @EJB
    ProductFacade productFacade; //moi cai dung 1 @EJB
    
   

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Discount form = new Discount();
 
      
        if (id == null) {
            req.setAttribute("form", form);
        } else {
            req.setAttribute("form", discountFacade.find(Integer.valueOf(id)));
        }
          req.setAttribute("listProduct", productFacade.findAll()); 
        req.getRequestDispatcher("/WEB-INF/admin/product/discount_form.jsp").include(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String discountValue = req.getParameter("discountValue");
        String discountStartDate = req.getParameter("discountStartDate");
        String discountEndDate = req.getParameter("discountEndDate");
//        String dateCreated = req.getParameter("dateCreated");
//        String dateModify = req.getParameter("dateModify");

        Discount form = new Discount();

        

        if (!req.getParameter("productName").isEmpty()) {
            Product pro = new Product();
            pro.setId(Integer.valueOf(req.getParameter("productName")));
            form.setProductID(pro);
        }

        // validate later
        
      boolean isValid = true;
       String err = "";
        try {  
            System.out.println("date submited " + discountStartDate);
            form.setDiscountValue(Integer.valueOf(discountValue));
            form.setDiscountStartDate(sfd.parse(discountStartDate));
            form.setDiscountEndDate(sfd.parse(discountEndDate));
            Date now = new Date();
            form.setDateCreated(now);
            form.setDateModify(now);
            
        } catch (Exception ex) {
            ex.printStackTrace();
            isValid = false;
            err += ex.getMessage() + "<br/>";
        }
        
        
        if (discountValue == null || discountValue.isEmpty()) {
            isValid = false;
            err += "Discount value can not be blank" + "<br/>";
        }
        
//         if (discount.getDiscountValue() > 100 || discount.getDiscountValue() < 1) {
//            isValid = false;
//            err += "Discount value must be greater than 1" + "<br/>";
//        }
        
         if ( discountStartDate == null || discountStartDate.isEmpty()) {
            isValid = false;
            err += "DiscountStartDate can not be blank" + "<br/>";
        }
         
          if ( discountEndDate == null || discountEndDate.isEmpty()) {
            isValid = false;
            err += "DiscountEndDate can not be blank" + "<br/>";
        }
         
        //
        if (isValid) {
           try {
            if (id == null) {
                discountFacade.create(form);
            } else {
                form.setId(Integer.valueOf(id));
                discountFacade.edit(form);
            }
            resp.sendRedirect(getServletContext().getContextPath() + "/discount");
        } catch (Exception ex) {
            LOG.info("Error save discount");
            err += "Cannot add " + ex.getMessage() + "<br/>";
        }
        }
            req.setAttribute("form", form);
            req.setAttribute("msgError", err);
            req.getRequestDispatcher("/WEB-INF/admin/product/discount_form.jsp").include(req, resp);
        

    
}

}
