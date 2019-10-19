/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.client.cart;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sem4.jee.g01jewelap.ejb.ProductFacade;

/**
 *
 * @author viet
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String metal = req.getParameter("metal");
        String diamond = req.getParameter("diamond");
        String gemstone = req.getParameter("gemstone");
        String price = req.getParameter("price");
        String width = req.getParameter("width");
        String weight = req.getParameter("weight");

        int id = productFacade.getIdByProductName(productName);
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        boolean check = false;
        if (check) {
            mapper.writeValue(resp.getOutputStream(), "addSuccess");
        } else {
            mapper.writeValue(resp.getOutputStream(), "addFail");
        }
    }

}
