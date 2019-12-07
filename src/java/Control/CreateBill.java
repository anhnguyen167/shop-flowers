/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.Basket;
import BEAN.BasketDetail;
import BEAN.User;
import DAO.BasketDAO;
import DAO.BasketDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CreateBill", urlPatterns = {"/CreateBill"})
public class CreateBill extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateBill</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBill at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            ArrayList<BasketDetail> list = new ArrayList<>();
            list = (ArrayList<BasketDetail>) session.getAttribute("list");
            int total = 0;
            for(BasketDetail i:list){
                total += i.getQuantity()*i.getProduct().getPrice();
            }
            // Lấy ngày trong hệ thống
            long millis=System.currentTimeMillis();  
            java.sql.Date date=new java.sql.Date(millis);       
            // Lấy địa chỉ
            String diaChi = request.getParameter("diaChi").toString();
            System.out.println("CreateBill: " + diaChi);
            // Trạng thái
            int state = 1;
            // Lưu vào trong cơ sở dữ liệu
            BasketDAO basketDAO = new BasketDAO();
            BasketDetailDAO basketDetailDAO = new BasketDetailDAO();
            
            // Lưu hóa đơn vào csdl
            Basket basket = new Basket(user, date, list, total, diaChi);
            basketDAO.insertBasket(basket);
            int last_id = basketDAO.getLastId();
            basket = basketDAO.getLastBasket(last_id);
            
            // Lưu basket_detail vào csdl
            for(BasketDetail i:list){
                basketDetailDAO.insertProductIntoBasket(i, basket);
            }
                    
            // Reset lại basket
            list = new ArrayList<>();
            int quantity = 0;
            session.setAttribute("list", list);
            session.setAttribute("quantity", quantity);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/click.jsp");
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
