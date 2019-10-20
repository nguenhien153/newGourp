/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.type;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import sem4.jee.g01jewelap.ejb.CategoryFacade;
import sem4.jee.g01jewelap.ejb.ProductTypeFacade;
import sem4.jee.g01jewelap.entity.mysql.ProductType;

/**
 *
 * @author nguen
 */
@WebServlet(name = "TypeServlet", urlPatterns = {"/manager/product-type"})
public class TypeServlet extends HttpServlet {
    
    @EJB
    private CategoryFacade categoryFacade;
    
    @EJB
    private ProductTypeFacade productTypeFacade;
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (null == id) {
            req.getRequestDispatcher("/WEB-INF/admin/product/type/manage-product-type.jsp").forward(req, resp);
        } else {
            try {
                if (null == productTypeFacade.find(Integer.valueOf(id))) {
                    resp.sendRedirect(req.getContextPath() + "/manager/product-type?failRemove");
                } else {
                    productTypeFacade.remove(productTypeFacade.find(Integer.valueOf(id)));
                    resp.sendRedirect(req.getContextPath() + "/manager/product-type?successRemove");
                }
            } catch (Exception e) {
                resp.sendRedirect(req.getContextPath() + "/manager/product-type?systemError");
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            String id = req.getParameter("id");
            if (id.isEmpty()) {
                String productTypeName = req.getParameter("productTypeName");
                String categoryName = req.getParameter("categoryName");
                ProductType productType = new ProductType();
                productType.setProductTypeName(productTypeName);
                String dateNow = sdf.format(new Date());
                productType.setDateCreate(sdf.parse(dateNow));
                HttpSession session = req.getSession();
                
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                
                productType.setCreateBy(accountInfo.getGmail());
                
                productType.setCategoryName(categoryFacade.findByName(categoryName));
                
                if (validate(productType, req)) {
                    productTypeFacade.create(productType);
                    resp.sendRedirect(req.getContextPath() + "/manager/product-type?success");
                } else {
                    req.setAttribute("productTypeName", req.getParameter("productTypeName"));
                    req.setAttribute("categoryName", req.getParameter("categoryName"));
                    req.getRequestDispatcher("/WEB-INF/admin/product/type/manage-product-type.jsp").forward(req, resp);
                }
            } else {
                String productTypeName = req.getParameter("productTypeName");
                String categoryName = req.getParameter("categoryName");
                
                ProductType productType = productTypeFacade.find(Integer.valueOf(id));
                productType.setProductTypeName(productTypeName);
                productType.setCategoryName(categoryFacade.findByName(categoryName));
                String dateNow = sdf.format(new Date());
                productType.setDateModify(sdf.parse(dateNow));
                HttpSession session = req.getSession();
                
                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");
                
                productType.setModifyBy(accountInfo.getGmail());
                if (validate(productType, req)) {
                    productTypeFacade.edit(productType);
                    resp.sendRedirect(req.getContextPath() + "/manager/product-type?successEdit");
                } else {
                    req.setAttribute("productTypeName", req.getParameter("productTypeName"));
                    req.setAttribute("categoryName", req.getParameter("categoryName"));
                    req.setAttribute("id", req.getParameter("id"));
                    req.getRequestDispatcher("/WEB-INF/admin/product/type/manage-product-type.jsp").forward(req, resp);
                }
            }
        } catch (ParseException ex) {
            resp.sendRedirect(req.getContextPath() + "/manager/product-type?systemError");
        }
    }
    
    private boolean validate(ProductType productType, HttpServletRequest req) {
        String regexCategory = "^[_A-z0-9]*((-|\\s)*[_A-z0-9])*$";
        Pattern type = Pattern.compile(regexCategory);
        Matcher m_type = type.matcher(productType.getProductTypeName());
        boolean check = true;
        if (productType.getProductTypeName() == null || m_type.find() == false
                || productType.getProductTypeName().length() > 40 || productType.getProductTypeName().length() < 4) {
            check = false;
            req.setAttribute("productTypeNameError", "Product type name not valid !!!");
        }
        if (null != productTypeFacade.findByName(productType.getProductTypeName())) {
            check = false;
            req.setAttribute("productTypeNameDupplicateError", "Product type name has been exist !!!");
        }
        if (null == productType.getCategoryName()) {
            check = false;
            req.setAttribute("CategoryNameNotExist", "Category name not exist !!!");
        }
        return check;
    }
    
}
