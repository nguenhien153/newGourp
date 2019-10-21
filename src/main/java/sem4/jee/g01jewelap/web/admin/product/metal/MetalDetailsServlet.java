/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.metal;

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
import sem4.jee.g01jewelap.ejb.MetalFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Metal;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "MetalDetailsServlet", urlPatterns = {"/manager/metal-details"})
public class MetalDetailsServlet extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    @EJB
    private MetalFacade metalFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String weight = req.getParameter("weight");
            String productName = req.getParameter("productName");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Metal metal = new Metal();
            if (req.getParameter("id").isEmpty()) {
                Product product = productFacade.findByProductName(productName);
                if (metalFacade.findByProductName(productName) == null) {
                    metal.setWeight(Float.valueOf(weight));
                    metal.setProductName(product);
                    String dateNow = sdf.format(new Date());
                    metal.setDateCreate(sdf.parse(dateNow));

                    HttpSession session = req.getSession();
                    AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                    metal.setCreateBy(accountInfo.getGmail());

                    metalFacade.create(metal);
                    resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + product.getId().toString() + "&successCreateMetal");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + product.getId().toString() + "&failCreateMetal");
                }
            } else {
                int id = Integer.valueOf(req.getParameter("id"));
                metal = metalFacade.find(id);
                metal.setWeight(Float.valueOf(weight));

                String dateNow = sdf.format(new Date());
                metal.setDateModify(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                metal.setModifyBy(accountInfo.getGmail());
                metalFacade.edit(metal);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + metal.getProductName().getId().toString() + "&successEditMetal");
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
            Metal metal = metalFacade.find(Integer.valueOf(req.getParameter("id")));
            if (null == metal) {
                resp.sendRedirect(req.getContextPath() + "/manager/product");
            } else {
                metalFacade.remove(metal);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + metal.getProductName().getId().toString() + "&successRemoveMetal");
            }
        }
    }

}
