/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.product;

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
import sem4.jee.g01jewelap.dto.ProductDTO;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "APIProduct", urlPatterns = {"/api-product"})
public class APIProduct extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String productName = req.getParameter("productName");
        if (null == productName) {
            List<Product> products = productFacade.findAll();
            List<ProductDTO> productDTOs = new ArrayList<>();
            for (Product item : products) {
                ProductDTO productDTO = new ProductDTO();
                productDTO.setCategoryName(item.getProductTypeName().getCategoryName().getCategoryName());
                productDTO.setDisplay(item.getDisplay() == true ? "true" : "false");
                productDTO.setHeight(String.valueOf(item.getHeight()));
                productDTO.setId(item.getId());
                productDTO.setLenght(String.valueOf(item.getLenght()));
                productDTO.setMakingCharges(String.valueOf(item.getMakingCharges()));
                productDTO.setProductName(item.getProductName());
                productDTO.setProductTypeName(item.getProductTypeName().getProductTypeName());
                productDTO.setTag(item.getTag());
                productDTO.setViewNumber(String.valueOf(item.getViewNumber()));
                productDTO.setWidth(String.valueOf(item.getWidth()));
                productDTO.setCreateBy(item.getCreateBy());
                productDTO.setModifyBy(item.getModifyBy());
                productDTO.setDateCreate(sdf.format(item.getDateCreate()));
                if (null != item.getModifyBy()) {
                    productDTO.setDateModify(sdf.format(item.getDateModify()));
                }
                productDTOs.add(productDTO);
            }
            mapper.writeValue(resp.getOutputStream(), productDTOs);
        } else {

        }
    }

}
