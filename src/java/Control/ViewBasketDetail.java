/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.Basket;
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
        Basket basket = (Basket) session.getAttribute("basket");
        
        if(basket != null){
            ArrayList<BEAN.BasketDetail> list = basket.getBasketDetail();
            if(list != null){
                int sum = 0;
                ArrayList<Product> p = new ArrayList<Product>();
                for(int i=0; i<list.size(); i++){
                    p.add(list.get(i).getProduct());
                    sum += p.get(i).getPrice()*list.get(i).getQuantity();
                }
                request.setAttribute("listSPA", p);
                request.setAttribute("total", sum);
                request.setAttribute("quantity", p.size());
            }else{
                request.setAttribute("quantity", 0);
            }
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/basketDetail.jsp");
            requestDispatcher.forward(request, response);
        }
        
       
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
        ProductDAO pDAO = new ProductDAO();
        int id = Integer.parseInt(request.getParameter("id").toString());
        Product pro = pDAO.getProductById(id);
        HttpSession session = request.getSession();
        Basket basket = (Basket) session.getAttribute("basket");
        BasketDetailDAO basketDetailDAO = new BasketDetailDAO();
        if(basket != null){
            int sum = 0;
            ArrayList<BEAN.BasketDetail> list = basket.getBasketDetail();
            if(list != null){
                ArrayList<Product> p = new ArrayList<Product>();
                for(int i=0; i<list.size(); i++){
                    if(list.get(i).getProduct().getId() == pro.getId()){
                        list.remove(i);
                        basketDetailDAO.deleteBasketDetail(list.get(i));
                    }else{
                        p.add(list.get(i).getProduct());
                        sum += p.get(i).getPrice()*list.get(i).getQuantity();
                    }
                }
                
                request.setAttribute("listSPA", p);
                request.setAttribute("total", sum);
                request.setAttribute("quantity", p.size());
            }else{
                request.setAttribute("quantity", 0);
            }
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/basketDetail.jsp");
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
