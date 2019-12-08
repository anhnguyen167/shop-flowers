/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.Basket;
import BEAN.BasketDetail;
import BEAN.Product;
import BEAN.User;
import DAO.BasketDetailDAO;
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
@WebServlet(name = "AddToBasket", urlPatterns = {"/AddToBasket"})
public class AddToBasket extends HttpServlet {

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
        HttpSession session = request.getSession();
        // Thêm vào giỏ hàng
        int idProduct = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(idProduct);
        ArrayList<BasketDetail> list = new ArrayList<>();
        list = (ArrayList<BasketDetail>) session.getAttribute("list");
        if(list == null) list = new ArrayList<>();
        int quantity = Integer.parseInt(request.getParameter("ten"));
        BasketDetail basketDetail = new BasketDetail(product, quantity);
        int check = 0;
        for(BasketDetail i:list){
            if(i.getProduct().getId() == idProduct){
                i.setQuantity(i.getQuantity() + quantity);
                check = 1;
                break;
            }
        }
        if(check == 0){
            list.add(basketDetail);
        }
        session.setAttribute("list", list);
        System.out.println(session.getAttribute("list"));
        session.setAttribute("quantity", list.size());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/click.jsp");
        requestDispatcher.forward(request, response);
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
