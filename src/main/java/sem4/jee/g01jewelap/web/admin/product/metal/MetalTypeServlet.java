/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.metal;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem4.jee.g01jewelap.dto.AccountInfo;
import sem4.jee.g01jewelap.dto.MetalTypeDTO;
import sem4.jee.g01jewelap.ejb.MetalTypeFacade;
import sem4.jee.g01jewelap.entity.mysql.MetalType;

/**
 *
 * @author nguen
 */
@WebServlet(name = "MetalTypeServlet", urlPatterns = {"/manager/metal-type"})
public class MetalTypeServlet extends HttpServlet {

    @EJB
    private MetalTypeFacade metalTypeFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            if (id == null) {
                MetalTypeDTO metalTypeDTO = new MetalTypeDTO();
                req.setAttribute("metalType", metalTypeDTO);
                req.getRequestDispatcher("/WEB-INF/admin/product/metal/metal-type.jsp").forward(req, resp);
            } else {
                MetalType metalType = metalTypeFacade.find(Integer.valueOf(id));
                if (metalType != null) {
                    if (metalType.getMetalOptionList().isEmpty()) {
                        metalTypeFacade.remove(metalType);;
                        resp.sendRedirect(req.getContextPath() + "/manager/metal-type?successRemove");
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/manager/metal-type?cannotDelete");
                    }
                } else {
                    resp.sendRedirect(req.getContextPath() + "/manager/metal-type?failRemove");
                }
            }
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/manager/metal-type?systemError");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            String metalTypeName = req.getParameter("metalTypeName");
            String rate = req.getParameter("rate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            boolean missing;
            if (id.isEmpty()) {
                MetalType metalType = new MetalType();
                metalType.setMetalTypeName(metalTypeName);
                metalType.setRate(BigDecimal.valueOf(Double.valueOf(rate)));
                String dateNow = sdf.format(new Date());
                metalType.setDateCreate(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                metalType.setCreateBy(accountInfo.getGmail());
                Map<String, String> mapError = new HashMap<>();
                missing = false;

                if (validate(metalType, mapError, missing)) {
                    metalTypeFacade.create(metalType);
                    resp.sendRedirect(req.getContextPath() + "/manager/metal-type?successCreate");
                } else {
                    MetalTypeDTO metalTypeDTO = new MetalTypeDTO();
                    metalTypeDTO.setMetalTypeName(metalTypeName);
                    metalTypeDTO.setRate(rate);
                    req.setAttribute("metalType", metalTypeDTO);
                    req.setAttribute("mapError", mapError);
                    req.getRequestDispatcher("/WEB-INF/admin/product/metal/metal-type.jsp").forward(req, resp);
                }
            } else {
                MetalType metalType = metalTypeFacade.find(Integer.valueOf(id));
                missing = metalType.getMetalTypeName().equals(metalTypeName);
                metalType.setMetalTypeName(metalTypeName);
                metalType.setRate(BigDecimal.valueOf(Double.valueOf(rate)));
                String dateNow = sdf.format(new Date());
                metalType.setDateModify(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                metalType.setModifyBy(accountInfo.getGmail());
                Map<String, String> mapError = new HashMap<>();
                if (validate(metalType, mapError, missing)) {
                    metalTypeFacade.edit(metalType);
                    resp.sendRedirect(req.getContextPath() + "/manager/metal-type?successEdit");
                } else {
                    MetalTypeDTO metalTypeDTO = new MetalTypeDTO();
                    metalTypeDTO.setId(id);
                    metalTypeDTO.setMetalTypeName(metalTypeName);
                    metalTypeDTO.setRate(rate);
                    req.setAttribute("metalType", metalTypeDTO);
                    req.setAttribute("mapError", mapError);
                    req.getRequestDispatcher("/WEB-INF/admin/product/metal/metal-type.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/manager/metal-type?systemError");
        }
    }

    private boolean validate(MetalType metalType, Map<String, String> mapError, boolean missing) {
        String regexSpecialCharacter = "^[_A-z0-9]*((-|\\s)*[_A-z0-9])*$";
        Pattern SpeCha = Pattern.compile(regexSpecialCharacter);
        Matcher m_specha = SpeCha.matcher(metalType.getMetalTypeName());
        if (metalTypeFacade.findByProductName(metalType.getMetalTypeName()) != null && missing == false) {
            mapError.put("dupplicateError", "Metal type has been exist !!!");
        }
        if (metalType.getMetalTypeName().length() < 4 || metalType.getMetalTypeName().length() > 50
                || m_specha.find() == false) {
            mapError.put("invalidFormat", "Metal type can not contain special character !!!");
        }

        return mapError.isEmpty();
    }

}
