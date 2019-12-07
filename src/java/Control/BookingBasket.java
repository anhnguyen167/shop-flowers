/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.BasketDetail;
import BEAN.User;
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
@WebServlet(name = "BookingBasket", urlPatterns = {"/BookingBasket"})
public class BookingBasket extends HttpServlet {

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
       HttpSession session = request.getSession();
       if(session.getAttribute("user") == null){
           
           RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
           requestDispatcher.forward(request, response);
       }else{
           User user = (User) session.getAttribute("user");
           ArrayList<BasketDetail> list = new ArrayList<>();
           list = (ArrayList<BasketDetail>) session.getAttribute("list");
           int quantity = (int) session.getAttribute("quantity");
           int total = 0;
           for(BasketDetail i: list){
               total += i.getQuantity()*i.getProduct().getPrice();
           }
           request.setAttribute("total", total);
           request.setAttribute("listSPA", list);
           session.setAttribute("user", user);
           session.setAttribute("list", list);
           session.setAttribute("quantity", quantity);
           RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/bill.jsp");
           requestDispatcher.forward(request, response);
       }
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
