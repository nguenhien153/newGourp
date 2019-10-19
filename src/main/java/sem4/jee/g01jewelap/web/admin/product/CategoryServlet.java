/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.web.admin.product;

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
        req.getRequestDispatcher("/WEB-INF/admin/product/manage-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String categoryName = req.getParameter("categoryName");

            Category category = new Category();
            category.setCategoryName(categoryName);
            String dateNow = sdf.format(new Date());
            category.setDateCreate(sdf.parse(dateNow));
            HttpSession session = req.getSession();

            AccountInfo accountInfo = (AccountInfo) session.getAttribute("accountInfo");

            category.setCreateBy(accountInfo.getUserID().toString());
            if (validate(category, req)) {
                categoryFacade.create(category);
                resp.sendRedirect(req.getContextPath() + "/manager/category?success");
            } else {
                req.getRequestDispatcher("/WEB-INF/admin/product/manage-category.jsp").forward(req, resp);
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
        if (categoryFacade.checkDupplicate(category.getCategoryName())==false) {
            check = false;
            req.setAttribute("CategoryNameDupplicateError", "Category name has been exist !!!");
        }
        return check;
    }

}
