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

import sem4.jee.g01jewelap.ejb.ProductDetailViewFacade;
import sem4.jee.g01jewelap.ejb.ProductViewFacade;
import sem4.jee.g01jewelap.entity.mysql.ProductDetailView;
import sem4.jee.g01jewelap.entity.mysql.ProductView;

/**
 *
 * @author nguen
 */
@WebServlet(urlPatterns = {"/api-displayproduct"})
public class DisplayProductServlet extends HttpServlet {

 
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

            ProductDetailView productDetailView = productDetailViewFacade.find(name);
         
            if (productDetailView == null) {
                mapper.writeValue(resp.getOutputStream(), "Not Found !!!");
            } else {
                mapper.writeValue(resp.getOutputStream(), productDetailView);
            }
        } else {
            List<ProductView> listPro = em.findAll();
            mapper.writeValue(resp.getOutputStream(), listPro);
        }

    }

}
