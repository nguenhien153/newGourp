/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.metal;

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
import sem4.jee.g01jewelap.dto.MetalTypeDTO;
import sem4.jee.g01jewelap.dto.ProductTypeDTO;
import sem4.jee.g01jewelap.ejb.MetalTypeFacade;
import sem4.jee.g01jewelap.entity.mysql.MetalType;
import sem4.jee.g01jewelap.entity.mysql.ProductType;

/**
 *
 * @author nguen
 */
@WebServlet(name = "APIMetalType", urlPatterns = {"/api-metaltype", "/api-auto-metaltype"})
public class APIMetalType extends HttpServlet {

    @EJB
    private MetalTypeFacade metalTypeFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        List<MetalType> metalTypes = metalTypeFacade.findAll();
        String uri = req.getRequestURI();
        if (uri.endsWith("/api-auto-metaltype")) {
            List<String> listMetalTypeName = new ArrayList<>();
            for (MetalType item : metalTypes) {
                listMetalTypeName.add(item.getMetalTypeName());
            }
            mapper.writeValue(resp.getOutputStream(), listMetalTypeName);
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            List<MetalTypeDTO> metalTypeDTOs = new ArrayList<>();
            for (MetalType item : metalTypes) {

                MetalTypeDTO metalTypeDTO = new MetalTypeDTO();

                metalTypeDTO.setId(item.getId().toString());
                metalTypeDTO.setMetalTypeName(item.getMetalTypeName());
                metalTypeDTO.setRate(item.getRate().toString());
                metalTypeDTO.setDateCreate(sdf.format(item.getDateCreate()));
                metalTypeDTO.setCreateBy(item.getCreateBy());

                if (null != item.getModifyBy()) {
                    metalTypeDTO.setDateModify(sdf.format(item.getDateModify()));
                }
                metalTypeDTO.setModifyBy(item.getModifyBy());
                metalTypeDTOs.add(metalTypeDTO);
            }
            mapper.writeValue(resp.getOutputStream(), metalTypeDTOs);
        }
    }

}
