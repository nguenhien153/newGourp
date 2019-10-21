/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.gemstone;

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
import sem4.jee.g01jewelap.ejb.GemstoneFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Gemstone;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "GemstoneDetailsServlet", urlPatterns = {"/manager/gemstone-details"})
public class GemstoneDetailsServlet extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    @EJB
    private GemstoneFacade gemstoneFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String carat = req.getParameter("carat");
            String totalNumber = req.getParameter("totalNumber");
            String productName = req.getParameter("productName");
            String lenght = req.getParameter("lenght");
            String width = req.getParameter("width");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Gemstone gemstone = new Gemstone();
            if (req.getParameter("id").isEmpty()) {
                Product product = productFacade.findByProductName(productName);
                gemstone.setCarat(Float.valueOf(carat));
                gemstone.setLenght(Float.valueOf(lenght));
                gemstone.setWidth(Float.valueOf(width));
                gemstone.setTotalNumber(Integer.valueOf(totalNumber));
                double totalWeight = gemstone.getCarat() * 0.2 * gemstone.getTotalNumber();
                gemstone.setTotalWeight((float) totalWeight);
                gemstone.setProductName(product);
                String dateNow = sdf.format(new Date());
                gemstone.setDateCreate(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                gemstone.setCreateBy(accountInfo.getGmail());

                gemstoneFacade.create(gemstone);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + product.getId().toString() + "&successCreateGemstone");
            } else {
                int id = Integer.valueOf(req.getParameter("id"));
                gemstone = gemstoneFacade.find(id);
                gemstone.setCarat(Float.valueOf(carat));
                gemstone.setLenght(Float.valueOf(lenght));
                gemstone.setWidth(Float.valueOf(width));
                gemstone.setTotalNumber(Integer.valueOf(totalNumber));
                double totalWeight = gemstone.getCarat() * 0.2 * gemstone.getTotalNumber();
                gemstone.setTotalWeight((float) totalWeight);

                String dateNow = sdf.format(new Date());
                gemstone.setDateModify(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                gemstone.setModifyBy(accountInfo.getGmail());

                gemstoneFacade.edit(gemstone);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + gemstone.getProductName().getId().toString() + "&successEditGemstone");
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
            Gemstone gemstone = gemstoneFacade.find(Integer.valueOf(req.getParameter("id")));
            if (null == gemstone) {
                resp.sendRedirect(req.getContextPath() + "/manager/product");
            } else {
                gemstoneFacade.remove(gemstone);
                resp.sendRedirect(req.getContextPath() + "/manager/product-details?id=" + gemstone.getProductName().getId().toString() + "&successRemoveGemstone");
            }
        }
    }
}
