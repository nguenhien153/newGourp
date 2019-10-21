package sem4.jee.g01jewelap.web.admin.product.type;

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
import sem4.jee.g01jewelap.dto.ProductTypeDTO;
import sem4.jee.g01jewelap.ejb.ProductTypeFacade;
import sem4.jee.g01jewelap.entity.mysql.ProductType;

@WebServlet({"/api-productype", "/api-auto-producttype"})
public class APITypeServlet extends HttpServlet {

    @EJB
    private ProductTypeFacade productTypeFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        List<ProductType> productTypes = productTypeFacade.findAll();
        String uri = req.getRequestURI();
        if (uri.endsWith("/api-auto-producttype")) {
            List<String> listProductTypeName = new ArrayList<>();
            for (ProductType item : productTypes) {
                listProductTypeName.add(item.getProductTypeName());
            }
            mapper.writeValue(resp.getOutputStream(), listProductTypeName);
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            List<ProductTypeDTO> productTypeDTOs = new ArrayList<>();
            for (ProductType item : productTypes) {

                ProductTypeDTO productTypeDTO = new ProductTypeDTO();

                productTypeDTO.setId(item.getId());
                productTypeDTO.setProductTypeName(item.getProductTypeName());
                productTypeDTO.setCategoryName(item.getCategoryName().getCategoryName());
                productTypeDTO.setDateCreate(sdf.format(item.getDateCreate()));
                productTypeDTO.setCreateBy(item.getCreateBy());

                if (null != item.getModifyBy()) {
                    productTypeDTO.setDateModify(sdf.format(item.getDateModify()));
                }
                productTypeDTO.setModifyBy(item.getModifyBy());
                productTypeDTOs.add(productTypeDTO);
            }
            mapper.writeValue(resp.getOutputStream(), productTypeDTOs);
        }
    }

}
