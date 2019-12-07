/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import BEAN.User;
import DAO.UserDAO;
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
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

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
            out.println("<title>Servlet SignUp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/SignUp.jsp");
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
       
        String regrex_mail = "^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$";
        String regrex_phone = "(09|01[2|6|8|9]|03)+([0-9]{8})";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String retypedPass = request.getParameter("password2");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int role = 1;
        UserDAO udao = new UserDAO();
        if(udao.checkUserExist(username) == true){
            request.setAttribute("error_username", "username is existed");
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/SignUp.jsp");
            requestDispatcher.forward(request, response);
        }else if(!password.equals(retypedPass)){
            request.setAttribute("error_pass", "retyped password doesn't match with password");
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/SignUp.jsp");
            requestDispatcher.forward(request, response);
        }else if(!email.matches(regrex_mail)){
            request.setAttribute("error_email", "email is invalid");
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/SignUp.jsp");
            requestDispatcher.forward(request, response);
        }else if(!phone.matches(regrex_phone)){
            request.setAttribute("error_phone", "phone is invalid");
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/SignUp.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            User user = new User(username, password, fullname, address, email, phone, role);
            udao.insertUser(user);
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("WEB-INF/jsp/login.jsp");
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
