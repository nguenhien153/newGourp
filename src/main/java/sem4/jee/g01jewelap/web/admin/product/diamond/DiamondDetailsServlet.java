/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.diamond;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem4.jee.g01jewelap.dto.AccountInfo;
import sem4.jee.g01jewelap.ejb.DiamondFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Diamond;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "DiamondDetailsServlet", urlPatterns = {"/manager/diamond-details"})
public class DiamondDetailsServlet extends HttpServlet {
    
    @EJB
    private ProductFacade productFacade;
    
    @EJB
    private DiamondFacade diamondFacade;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String carat = req.getParameter("carat");
            String totalNumber = req.getParameter("totalNumber");
            String productName = req.getParameter("productName");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Diamond diamond = new Diamond();
            if (req.getParameter("id").isEmpty()) {
                Product product = productFacade.findByProductName(productName);
                diamond.setCarat(Float.valueOf(carat));
                diamond.setTotalNumber(Integer.valueOf(totalNumber));
                double totalWeight = diamond.getCarat() * 0.2 * diamond.getTotalNumber();
                diamond.setTotalWeight((float) totalWeight);
                diamond.setProductName(product);
                String dateNow = sdf.format(new Date());
                diamond.setDateCreate(sdf.parse(dateNow));
                
                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                diamond.setCreateBy(accountInfo.getGmail());
                
                diamondFacade.create(diamond);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + product.getId().toString() + "&successCreateDiamond");
            } else {
                int id = Integer.valueOf(req.getParameter("id"));
                diamond = diamondFacade.find(id);
                diamond.setCarat(Float.valueOf(carat));
                diamond.setTotalNumber(Integer.valueOf(totalNumber));
                double totalWeight = diamond.getCarat() * 0.2 * diamond.getTotalNumber();
                diamond.setTotalWeight((float) totalWeight);
                
                String dateNow = sdf.format(new Date());
                diamond.setDateModify(sdf.parse(dateNow));
                
                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                diamond.setModifyBy(accountInfo.getGmail());
                
                diamondFacade.edit(diamond);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + diamond.getProductName().getId().toString() + "&successEditDiamond");
            }
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/manager/product?systemError");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (null == req.getParameter("id")) {
            resp.sendRedirect(req.getContextPath() + "/manager/product");
        } else {
            Diamond diamond = diamondFacade.find(Integer.valueOf(req.getParameter("id")));
            if (null == diamond) {
                resp.sendRedirect(req.getContextPath() + "/manager/product");
            } else {
                diamondFacade.remove(diamond);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + diamond.getProductName().getId().toString() + "&successRemoveDiamond");
            }
        }
    }
    
}
