/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product.category;

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
import sem4.jee.g01jewelap.entity.mysql.Category;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/manager/category"})
public class CategoryServlet extends HttpServlet {

    @EJB
    private CategoryFacade categoryFacade;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (null == id) {
            req.getRequestDispatcher("/WEB-INF/admin/product/manage-category.jsp").forward(req, resp);
        } else {
            try {
                if (null ==categoryFacade.find(Integer.valueOf(id))) {
                     resp.sendRedirect(req.getContextPath() + "/manager/category?failRemove");
                } else {
                    categoryFacade.remove(categoryFacade.find(Integer.valueOf(id)));
                    resp.sendRedirect(req.getContextPath() + "/manager/category?successRemove");
                }
            } catch (Exception e) {
                resp.sendRedirect(req.getContextPath() + "/manager/category?systemError");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String id = req.getParameter("id");
            if (id.isEmpty()) {
                String categoryName = req.getParameter("categoryName");

                Category category = new Category();
                category.setCategoryName(categoryName);
                String dateNow = sdf.format(new Date());
                category.setDateCreate(sdf.parse(dateNow));
                HttpSession session = req.getSession();

                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");

                category.setCreateBy(accountInfo.getGmail());
                if (validate(category, req)) {
                    categoryFacade.create(category);
                    resp.sendRedirect(req.getContextPath() + "/manager/category?success");
                } else {
                    req.setAttribute("categoryName", req.getParameter("categoryName"));
                    req.getRequestDispatcher("/WEB-INF/admin/product/manage-category.jsp").forward(req, resp);
                }
            } else {
                String categoryName = req.getParameter("categoryName");
                Category category = categoryFacade.find(Integer.valueOf(id));

                category.setCategoryName(categoryName);
                String dateNow = sdf.format(new Date());
                category.setDateModify(sdf.parse(dateNow));
                HttpSession session = req.getSession();

                AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");

                category.setModifyBy(accountInfo.getGmail());
                if (validate(category, req)) {
                    categoryFacade.edit(category);
                    resp.sendRedirect(req.getContextPath() + "/manager/category?successEdit");
                } else {
                    req.setAttribute("categoryName", req.getParameter("categoryName"));
                    req.setAttribute("id", req.getParameter("id"));
                    req.getRequestDispatcher("/WEB-INF/admin/product/manage-category.jsp").forward(req, resp);
                }
            }
        } catch (ParseException ex) {
            resp.sendRedirect(req.getContextPath() + "/manager/category?systemError");
        }
    }

    private boolean validate(Category category, HttpServletRequest req) {
        String regexCategory = "^[_A-z0-9]*((-|\\s)*[_A-z0-9])*$";
        Pattern cate = Pattern.compile(regexCategory);
        Matcher m_cate = cate.matcher(category.getCategoryName());
        boolean check = true;
        if (category.getCategoryName() == null || m_cate.find() == false
                || category.getCategoryName().length() > 40 || category.getCategoryName().length() < 4) {
            check = false;
            req.setAttribute("categoryNameError", "Category name not valid !!!");
        }
        boolean checkDupplicate = categoryFacade.checkDupplicate(category.getCategoryName());
        if (checkDupplicate == false) {
            check = false;
            req.setAttribute("CategoryNameDupplicateError", "Category name has been exist !!!");
        }
        return check;
    }

}
