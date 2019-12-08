/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.BasketDetail;
import BEAN.Product;
import BEAN.User;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewAll", urlPatterns = {"/ViewAll"})
public class ViewAll extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession httpSession = request.getSession();
//        String id = httpSession.getAttribute("id").toString();
//        System.out.println("UserID " + id);
//        System.out.println(request.getQueryString());
//        String categoryId;
         HttpSession session = request.getSession();
        ArrayList<BasketDetail> list;
        int quantity = 0;
        list = new ArrayList<>();
        list = (ArrayList<BasketDetail>) session.getAttribute("list");
        for (BasketDetail i : list) {
            quantity += i.getQuantity();
        }
        if (session.getAttribute("user") != null) {
            session.setAttribute("user", (User) session.getAttribute("user"));
        }
        session.setAttribute("list", list);
        session.setAttribute("quantity", quantity);
        
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        int type = Integer.parseInt(request.getParameter("type"));
        ArrayList<Product> listSPA = productDAO.getProductsByType(type);
        System.out.println(listSPA.size() + "");
        request.setAttribute("listSPA", listSPA);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/viewAll.jsp");
        requestDispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
