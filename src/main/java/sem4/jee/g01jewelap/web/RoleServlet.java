///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package sem4.jee.g01jewelap.web;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.logging.Logger;
//import javax.ejb.EJB;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import sem4.jee.g01jewelap.ejb.RoleFacade;
//
///**
// *
// * @author thao
// */
//@WebServlet(name = "RoleServlet", urlPatterns = {"/RoleServlet"})
//public class RoleServlet extends HttpServlet {
//    
//    private static final Logger LOG = Logger.getLogger(RoleServlet.class.getName());
//    private static final long serialVersionUID = 1L;
//    
//    @EJB
//    RoleFacade roleFacade;
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        LOG.info("get /RoleServlet");
//        
//        String idDelete = req.getParameter("delete");
//        if (idDelete != null) {
//            roleFacade.remove(roleFacade.find(Integer.valueOf(idDelete)));
//            resp.sendRedirect(req.getContextPath() + "/RoleServlet");
//            return;
//        }
//        req.setAttribute("listRole", roleFacade.findAll());
//        req.getRequestDispatcher("/WEB-INF/admin/role_list.jsp").include(req, resp);
//        
//        
//    }
//    
//
//   
//}
