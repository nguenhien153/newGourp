/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.product;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import sem4.jee.g01jewelap.dto.ProductDTO;
import sem4.jee.g01jewelap.ejb.CategoryFacade;
import sem4.jee.g01jewelap.ejb.ProductFacade;
import sem4.jee.g01jewelap.ejb.ProductTypeFacade;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@WebServlet(name = "ManageProductServlet", urlPatterns = {"/manager/product"})
public class ManageProductServlet extends HttpServlet {

    @EJB
    private CategoryFacade categoryFacade;

    @EJB
    private ProductTypeFacade productTypeFacade;

    @EJB
    private ProductFacade productFacade;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (null == id) {
            ProductDTO productDTO = new ProductDTO();
            req.setAttribute("product", productDTO);
            req.getRequestDispatcher("/WEB-INF/admin/product/product/manage-product.jsp").forward(req, resp);
        } else {
            try {
                if (null == productFacade.find(Integer.valueOf(id))) {
                    resp.sendRedirect(req.getContextPath() + "/manager/product?failRemove");
                } else {
                    Product product = productFacade.find(Integer.valueOf(id));
                    if (product.getDiamondList().isEmpty() && product.getDiamondOptionList().isEmpty()
                            && product.getDiamondOptionList().isEmpty() && product.getDiscountList().isEmpty()
                            && product.getGemstoneList().isEmpty() && product.getImageList().isEmpty()
                            && product.getInvoiceDetailList().isEmpty() && product.getMetalList().isEmpty() 
                            && product.getMetalOptionList().isEmpty() && product.getStockList().isEmpty() 
                            && product.getShoppingcartList().isEmpty()) {
                        productFacade.remove(productFacade.find(Integer.valueOf(id)));
                        resp.sendRedirect(req.getContextPath() + "/manager/product?successRemove");
                    }else
                    {
                        resp.sendRedirect(req.getContextPath() + "/manager/product?cannotDelete");
                    }

                }
            } catch (Exception e) {
                resp.sendRedirect(req.getContextPath() + "/manager/product?systemError");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            boolean missing;
            String id = req.getParameter("id");
            String productName = req.getParameter("productName");
            String productTypeName = req.getParameter("productTypeName");
            String lenght = req.getParameter("lenght");
            String height = req.getParameter("height");
            String width = req.getParameter("width");
            String makingCharges = req.getParameter("makingCharges");
            String display = req.getParameter("display");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if (id.isEmpty()) {
                Product product = new Product();
                product.setProductName(productName);
                product.setProductTypeName(productTypeFacade.findByName(productTypeName));
                product.setLenght(Float.valueOf(lenght));
                product.setHeight(Float.valueOf(height));
                product.setWidth(Float.valueOf(width));
                product.setMakingCharges(BigDecimal.valueOf(Double.valueOf(makingCharges)));
                product.setDisplay(display != null);

                String dateNow = sdf.format(new Date());
                product.setDateCreate(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                product.setCreateBy(accountInfo.getGmail());
                Map<String, String> mapError = new HashMap<>();
                missing = false;
                if (validate(product, mapError, missing)) {
                    productFacade.create(product);
                    resp.sendRedirect(req.getContextPath() + "/manager/product?successCreate");
                } else {
                    ProductDTO productDTO = new ProductDTO();
                    productDTO.setDisplay(product.getDisplay() == true ? "checked" : "");
                    productDTO.setProductName(productName);
                    productDTO.setProductTypeName(productTypeName);
                    productDTO.setLenght(lenght);
                    productDTO.setHeight(height);
                    productDTO.setWidth(width);
                    productDTO.setMakingCharges(makingCharges);
                    req.setAttribute("mapError", mapError);
                    req.setAttribute("product", productDTO);
                    req.getRequestDispatcher("/WEB-INF/admin/product/product/manage-product.jsp").forward(req, resp);
                }
            } else {
                Product product = productFacade.find(Integer.valueOf(id));
                missing = product.getProductName().equals(productName);
                product.setProductName(productName);
                product.setProductTypeName(productTypeFacade.findByName(productTypeName));
                product.setLenght(Float.valueOf(lenght));
                product.setHeight(Float.valueOf(height));
                product.setWidth(Float.valueOf(width));
                product.setMakingCharges(BigDecimal.valueOf(Double.valueOf(makingCharges)));
                product.setDisplay(display != null);

                String dateNow = sdf.format(new Date());
                product.setDateModify(sdf.parse(dateNow));

                HttpSession session = req.getSession();
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                product.setModifyBy(accountInfo.getGmail());
                Map<String, String> mapError = new HashMap<>();
                if (validate(product, mapError, missing)) {
                    productFacade.edit(product);
                    resp.sendRedirect(req.getContextPath() + "/manager/product?successEdit");
                } else {
                    ProductDTO productDTO = new ProductDTO();
                    productDTO.setDisplay(product.getDisplay() == true ? "checked" : "");
                    productDTO.setProductName(productName);
                    productDTO.setProductTypeName(productTypeName);
                    productDTO.setLenght(lenght);
                    productDTO.setHeight(height);
                    productDTO.setWidth(width);
                    productDTO.setMakingCharges(makingCharges);
                    req.setAttribute("mapError", mapError);
                    req.setAttribute("product", productDTO);
                    req.getRequestDispatcher("/WEB-INF/admin/product/product/manage-product.jsp").forward(req, resp);
                }
            }
        } catch (ParseException ex) {
            resp.sendRedirect(req.getContextPath() + "/manager/prduct?systemError");
        }
    }

    private boolean validate(Product product, Map<String, String> mapError, boolean missing) {
        String regexSpecialCharacter = "^[_A-z0-9]*((-|\\s)*[_A-z0-9])*$";
        Pattern SpeCha = Pattern.compile(regexSpecialCharacter);
        Matcher m_specha = SpeCha.matcher(product.getProductName());
        if (productFacade.findByProductName(product.getProductName()) != null && missing == false) {
            mapError.put("dupplicateError", "Product name has been exist !!!");
        }
        if (product.getProductName().length() < 4 || product.getProductName().length() > 50
                || m_specha.find() == false) {
            mapError.put("invalidFormat", "Product name not contain special character !!!");
        }
        if (product.getProductTypeName() == null) {
            mapError.put("productTypeNotExist", "Type name not exist !!!");
        }

        return mapError.isEmpty();
    }

}
