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
import DAO.UserDAO;
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
@WebServlet({"/AuthServlet"})
public class AuthServlet extends HttpServlet {

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
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
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
        handleLogin(request, response);
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

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1. An nut Dang Nhap thi goi vao day
        //2. Lay Username, password tu form dang nhap
        //3. Kiem tra tai khoan
        //4. Hien thong bao that bai hoac redirect ve trang chu neu thanh cong
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.checkUser(username, password);
        if (user != null && user.getRole() == 1){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            ArrayList<BEAN.BasketDetail> list = (ArrayList<BEAN.BasketDetail>) session.getAttribute("list");
            int quantity = 0;
            if(list != null){
                for(BasketDetail i:list){
                    quantity += i.getQuantity();
                }
            }
            session.setAttribute("list", list);
            session.setAttribute("quantity", quantity);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/click.jsp");
            requestDispatcher.forward(request, response);
        } else if (user != null && user.getRole() == 0){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/manager.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
    

}
