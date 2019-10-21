/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.details;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguen
 */
@WebServlet(name = "ProductDetailsServlet", urlPatterns = {"/manager/product-details"})
public class ProductDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") == null) {
            resp.sendRedirect(req.getContextPath() + "/manager/product");
        } else {
            int id = Integer.valueOf(req.getParameter("id"));
            req.getRequestDispatcher("/WEB-INF/admin/product/details/product-details.jsp").forward(req, resp);
        }
    }

}
