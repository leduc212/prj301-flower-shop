/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.servlet;

import duclm.dao.OrderDAO;
import duclm.dto.Account;
import duclm.dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leduc
 */
public class viewOrderServlet extends HttpServlet {

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

            String dateFrom = request.getParameter("from");
            String dateTo = request.getParameter("to");
            HttpSession session = request.getSession(true);
            Account loginedUser = (Account) session.getAttribute("loginedUser");

            ArrayList<Order> allOrderList = OrderDAO.getOrders(loginedUser.getEmail());
            ArrayList<Order> orderList = new ArrayList<>();

            int orderStatus;
            String orderHeader;
            String action = (String) request.getParameter("action");
            if (action.equalsIgnoreCase("completedOrder")) {
                orderStatus = 2;
                orderHeader = "Completed Order:";
            } else if (action.equalsIgnoreCase("processingOrder")) {
                orderStatus = 1;
                orderHeader = "Processing Order:";
            } else {
                orderStatus = 3;
                orderHeader = "Canceled Order:";
            }

            for (Order ord : allOrderList) {
                if (ord.getStatus() == orderStatus) {
                    orderList.add(ord);
                }
            }

            request.setAttribute("orderList", orderList);
            request.setAttribute("statusHeader", orderHeader);
            request.getRequestDispatcher("personalPage.jsp").forward(request, response);
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
