/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.servlet;

import duclm.dao.AccountDAO;
import duclm.dao.OrderDAO;
import duclm.dto.Account;
import duclm.dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leduc
 */
public class loginServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String save = request.getParameter("savelogin");
            Account acc = null;
            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie acookie : c) {
                            if (acookie.getName().equals("selector")) {
                                token = acookie.getValue();
                            }
                        }
                    }
                    if (!token.equals("")) {
                        HttpSession session = request.getSession(true);

                        acc = (Account) session.getAttribute("loginedUser");
                        int role = 0;
                        if (acc == null) {
                            token = "";
                            for (Cookie aCookie : c) {
                                if (aCookie.getName().equals("selector")) {
                                    token = aCookie.getValue();
                                    acc = AccountDAO.getAccountByToken(token);
                                    role = acc.getRole();
                                    if (acc != null) {
                                        session.setAttribute("loginedUser", acc);  
                                    }
                                }
                            }
                        }
                        
                        if (role != 0) {
                            request.getRequestDispatcher("adminindex.jsp").forward(request, response);
                        } else {
                            request.getRequestDispatcher("allOrderServlet").forward(request, response);
                        }         
                    } else {
                        request.setAttribute("ERROR", "Please insert your email and password!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        response.sendRedirect("login.jsp");
                    }
                } else {
                    acc = AccountDAO.getAccount(email, password);
                    if (acc != null) {
                        //admin
                        if (acc.getRole() == 1) {
                            //Chuyen qua admin home page
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("loginedUser", acc); 
                                //create a cookie and attach it to response object
                                if (save != null) {
                                    Random rand = new Random();
                                    int random = rand.nextInt(10000);
                                    String token = "ABC" + Integer.toString(random);//sample token
                                    AccountDAO.updateToken(email, token);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);//sample
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("adminindex.jsp");
                            }
                        } //user
                        else {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("loginedUser", acc); 
                                //create a cookie and attach it to response object
                                if (save != null) {
                                    Random rand = new Random();
                                    int random = rand.nextInt(10000);
                                    String token = "ABC" + Integer.toString(random);
                                    AccountDAO.updateToken(email, token);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);
                                    response.addCookie(cookie);
                                }

                                request.getRequestDispatcher("allOrderServlet").forward(request, response);
                            }
                        }
                    } else {
                        request.setAttribute("ERROR", "Username or password is wrong!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        response.sendRedirect("login.jsp");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

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
