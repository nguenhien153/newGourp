/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.client.product;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;

import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.dto.ProductDetailOption;
import sem4.jee.g01jewelap.ejb.DiamondFacade;
import sem4.jee.g01jewelap.ejb.DiamondViewFacade;
import sem4.jee.g01jewelap.ejb.GemstoneFacade;
import sem4.jee.g01jewelap.ejb.GemstoneViewFacade;
import sem4.jee.g01jewelap.ejb.MetalViewFacade;

import sem4.jee.g01jewelap.ejb.ProductDetailViewFacade;
import sem4.jee.g01jewelap.ejb.ProductViewFacade;
import sem4.jee.g01jewelap.entity.mysql.Diamond;
import sem4.jee.g01jewelap.entity.mysql.DiamondView;
import sem4.jee.g01jewelap.entity.mysql.Gemstone;
import sem4.jee.g01jewelap.entity.mysql.GemstoneView;
import sem4.jee.g01jewelap.entity.mysql.MetalView;
import sem4.jee.g01jewelap.entity.mysql.ProductDetailView;
import sem4.jee.g01jewelap.entity.mysql.ProductView;

/**
 *
 * @author nguen
 */
@WebServlet(urlPatterns = {"/api-displayproduct"})
public class DisplayProductServlet extends HttpServlet {

    @EJB
    private GemstoneFacade gemstoneFacade;

    @EJB
    private MetalViewFacade metalViewFacade;

    @EJB
    private GemstoneViewFacade gemstoneViewFacade;

    @EJB
    private DiamondViewFacade diamondViewFacade;

    @EJB
    private DiamondFacade diamondFacade;

    @EJB
    private ProductDetailViewFacade productDetailViewFacade;

    @EJB
    private ProductViewFacade em;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();

        if (req.getParameter("name") != null) {
            String name = req.getParameter("name");

            ProductDetailOption ProductDetailOption = new ProductDetailOption();

            List<Diamond> listDiamond = diamondFacade.findByName(name);
            List<Gemstone> listGemstone = gemstoneFacade.findByName(name);

            List<DiamondView> diamondViews = diamondViewFacade.findByName(name);
            List<GemstoneView> gemstoneViews = gemstoneViewFacade.findByName(name);
            List<MetalView> metalViews = metalViewFacade.findByName(name);

            ProductDetailView productDetailView = productDetailViewFacade.find(name);

            if (productDetailView == null && metalViews == null) {
                mapper.writeValue(resp.getOutputStream(), "Not Found !!!");
            } else {

                ProductDetailOption.setListDiamond(listDiamond);
                ProductDetailOption.setListGemstone(listGemstone);

                ProductDetailOption.setDiamondViews(diamondViews);
                ProductDetailOption.setGemstoneViews(gemstoneViews);
                ProductDetailOption.setMetalViews(metalViews);

                ProductDetailOption.setDetailView(productDetailView);
                mapper.writeValue(resp.getOutputStream(), ProductDetailOption);
            }
        } else {
            List<ProductView> listPro = em.findAll();
            mapper.writeValue(resp.getOutputStream(), listPro);
        }

    }

}
