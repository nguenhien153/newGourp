/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.category;

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
import sem4.jee.g01jewelap.dto.CategoryDTO;
import sem4.jee.g01jewelap.ejb.CategoryFacade;
import sem4.jee.g01jewelap.entity.mysql.Category;

/**
 *
 * @author nguen
 */
@WebServlet(name = "APICategoryServlet", urlPatterns = {"/api-category", "/api-auto-category"})
public class APICategoryServlet extends HttpServlet {

    @EJB
    private CategoryFacade categoryFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        List<Category> categorys = categoryFacade.findAll();
        String uri = req.getRequestURI();
        if (uri.endsWith("/api-auto-category")) {
            List<String> listCateName = new ArrayList<>();
            for (Category item : categorys) {
                listCateName.add(item.getCategoryName());
            }
            mapper.writeValue(resp.getOutputStream(), listCateName);
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            List<CategoryDTO> categoryDTOs = new ArrayList<>();
            for (Category category : categorys) {
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.setId(category.getId());
                categoryDTO.setCategoryName(category.getCategoryName());
                categoryDTO.setCreateBy(category.getCreateBy());
                categoryDTO.setModifyBy(category.getModifyBy());
                categoryDTO.setDateCreate(sdf.format(category.getDateCreate()));
                if (null != category.getModifyBy()) {
                    categoryDTO.setDateModify(sdf.format(category.getDateModify()));
                }
                categoryDTOs.add(categoryDTO);
            }
            mapper.writeValue(resp.getOutputStream(), categoryDTOs);
        }
    }

}
