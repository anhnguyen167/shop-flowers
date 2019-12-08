/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.Basket;
import BEAN.BasketDetail;
import BEAN.Product;
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
@WebServlet(name = "ViewBasketDetail", urlPatterns = {"/ViewBasketDetail"})
public class ViewBasketDetail extends HttpServlet {

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
        int sum = 0;
        int total = 0;
//        if(session.getAttribute("isLogin") != null){
        ArrayList<BasketDetail> list = new ArrayList<>();
        list = (ArrayList<BasketDetail>) session.getAttribute("list");
        if (list == null) {
            list = new ArrayList<>();
        }
        int quantity = list.size();
        
        for (BasketDetail i : list) {
            total += i.getProduct().getPrice() * i.getQuantity();
            sum += i.getQuantity();
       
        }
        
//        }
        session.setAttribute("list", list);
        session.setAttribute("quantity", sum);
        System.out.println(sum);
        request.setAttribute("listSPA", list);
        request.setAttribute("sum", sum);
        request.setAttribute("total", total);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/basketDetail.jsp");
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
        int idProduct = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        ArrayList<BasketDetail> list = new ArrayList<>();
        list = (ArrayList<BasketDetail>) session.getAttribute("list");
        int sum = 0;
        int total = 0;
        for(BasketDetail i:list){
            if(idProduct == i.getProduct().getId()){
                list.remove(i);
                break;
            }
        }
        sum = list.size();
        for(BasketDetail i:list){
           total += i.getQuantity()*i.getProduct().getPrice();
        }
        session.setAttribute("list", list);
        session.setAttribute("quantity", list.size());
        request.setAttribute("listSPA", list);
        request.setAttribute("sum", sum);
        request.setAttribute("total", total);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/basketDetail.jsp");
        requestDispatcher.forward(request, response);

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
