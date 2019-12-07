/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.BasketDetail;
import BEAN.Product;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "GetFlowers", urlPatterns = {"/GetFlowers"})
public class GetFlowers extends HttpServlet {

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
//        System.out.println(request.getQueryString());
//        HttpSession session = request.getSession();
//        boolean isLogin = session.getAttribute("islogin") != null ? (boolean)session.getAttribute("islogin") : false;
//        if (!isLogin) {
//            session = request.getSession(true);
//            System.out.println(session.getId());
//        } else {
//            //xu ly khi ma nguoi dung da dang nhap    
//        }
        
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> listSP1 = productDAO.getProductsByTypeLimit(1);
        ArrayList<Product> listSP2 = productDAO.getProductsByTypeLimit(2);
        ArrayList<Product> listSP3 = productDAO.getProductsByTypeLimit(3);
        ArrayList<Product> listSP4 = productDAO.getProductsByTypeLimit(4);
        request.setAttribute("listSP1", listSP1);
        request.setAttribute("listSP2", listSP2);
        request.setAttribute("listSP3", listSP3);
        request.setAttribute("listSP4", listSP4);
        
        // Khai báo session
        HttpSession session = request.getSession();
        
        // Nếu chưa đăng nhập tạo session cho khách vãng la
        if(session.getAttribute("list") == null){
            ArrayList<BasketDetail> list = new ArrayList<>();
            session.setAttribute("list", list);
            session.setAttribute("quantity", list.size());
        }else{
            ArrayList<BasketDetail> list = (ArrayList<BasketDetail>) session.getAttribute("list");
            int quantity = Integer.parseInt(session.getAttribute("quantity").toString());
            session.setAttribute("list", list);
            session.setAttribute("quantity", quantity);
        }
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/index.jsp");
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
