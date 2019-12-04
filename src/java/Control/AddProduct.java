/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.Product;
import DAO.ProductDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

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
        String product_name = (String) request.getParameter("product_name");
        String image = (String) request.getParameter("image");
        int type = Integer.parseInt(request.getParameter("type"));
        int color = Integer.parseInt(request.getParameter("color"));
        int state = Integer.parseInt(request.getParameter("state"));
        int price = Integer.parseInt(request.getParameter("price"));
        String decription = (String) request.getParameter("description");
        Product product = new Product();
        if(type==1){
            product.setImage("/Hoa/Basket/"+image);
        }
        if(type==2){
            product.setImage("/Hoa/Bouquets/"+image);
        }
        if(type==3){
            product.setImage("/Hoa/Box/"+image);
        }
        if(type==4){
            product.setImage("/Hoa/Shelf/"+image);
        }
        product.setProduct_name(product_name);
        product.setType(type);
        product.setColor(color);
        product.setState(state);
        product.setColor(price);
        product.setDescription(decription);
   
        
        ProductDAO productDAO = new ProductDAO();
        productDAO.insertProduct(product);
        response.sendRedirect("/FlowersShop/nManager");
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
