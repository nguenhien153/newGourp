/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.details;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.dto.ProductDetailsDTO;
import sem4.jee.g01jewelap.ejb.DiamondFacade;
import sem4.jee.g01jewelap.ejb.GemstoneFacade;
import sem4.jee.g01jewelap.ejb.ImageFacade;
import sem4.jee.g01jewelap.ejb.MetalFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Diamond;
import sem4.jee.g01jewelap.entity.mysql.Gemstone;
import sem4.jee.g01jewelap.entity.mysql.Image;
import sem4.jee.g01jewelap.entity.mysql.Metal;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "APIDetailsServlet", urlPatterns = {"/api-product-details"})
public class APIDetailsServlet extends HttpServlet {

    @EJB
    private ImageFacade imageFacade;

    @EJB
    private GemstoneFacade gemstoneFacade;

    @EJB
    private DiamondFacade diamondFacade;

    @EJB
    private MetalFacade metalFacade;

    @EJB
    private ProductFacade productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        ProductDetailsDTO detailsDTO = new ProductDetailsDTO();
        String id = req.getParameter("id");
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        try {
            if (id == null) {
                mapper.writeValue(resp.getOutputStream(), detailsDTO);
            } else {
                Product product = productFacade.findById(Integer.valueOf(id));
                if (null == product) {
                    mapper.writeValue(resp.getOutputStream(), detailsDTO);
                } else {

                    List<Diamond> diamonds = new ArrayList<>();
                    if (diamondFacade.findByProductName(product.getProductName()) != null) {
                        for (Diamond diamond : diamondFacade.findByProductName(product.getProductName())) {
                            diamond.setProductName(null);
                            diamonds.add(diamond);
                        }
                    }
                    detailsDTO.setDiamonds(diamonds);

                    List<Gemstone> gemstones = new ArrayList<>();
                    if (gemstoneFacade.findByProductName(product.getProductName()) != null) {
                        for (Gemstone gemstone : gemstoneFacade.findByProductName(product.getProductName())) {
                            gemstone.setProductName(null);
                            gemstones.add(gemstone);
                        }
                    }
                    detailsDTO.setGemstones(gemstones);

                    List<Metal> metals = new ArrayList<>();
                    Metal metal = metalFacade.findByProductName(product.getProductName());
                    if (null != metal) {
                        metal.setProductName(null);
                        metals.add(metal);
                    }
                    detailsDTO.setMetals(metals);

                    List<Image> images = new ArrayList<>();
                    if (imageFacade.findByProductName(product.getProductName()) != null) {
                        for (Image image : imageFacade.findByProductName(product.getProductName())) {
                            image.setMetalOptionList(null);
                            image.setProductName(null);
                            images.add(image);
                        }
                    }
                    detailsDTO.setImages(images);

                    detailsDTO.setId(Integer.valueOf(id));
                    detailsDTO.setProductName(product.getProductName());
                    mapper.writeValue(resp.getOutputStream(), detailsDTO);
                }
            }
        } catch (IllegalArgumentException e) {
            mapper.writeValue(resp.getOutputStream(), detailsDTO);
        }
    }
}
