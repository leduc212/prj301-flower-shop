/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.servlet;

import duclm.dao.OrderDAO;
import duclm.dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leduc
 */
public class searchOrderAdminServlet extends HttpServlet {

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
            
            ArrayList<Order> allOrderList = OrderDAO.getOrders();
            ArrayList<Order> orderList = new ArrayList<>();
            if ((dateTo == null || dateTo.equals("")) || (dateFrom == null || dateFrom.equals(""))) {
                orderList = allOrderList;
            } else {
                try {
                    Date dateFromDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateFrom);
                    Date dateToDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateTo);
                    for (Order ord : allOrderList) {
                        Date todayDate = new SimpleDateFormat("yyyy-MM-dd").parse(ord.getOrderDate());
                        if (todayDate.compareTo(dateFromDate) >= 0 && todayDate.compareTo(dateToDate) <= 0) {
                            orderList.add(ord);
                        }
                    }
                } catch (ParseException ex) {
                    ex.printStackTrace();
                } 
            }
            request.setAttribute("from", dateFrom);
            request.setAttribute("to", dateTo);
            request.setAttribute("searched", true);
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("ManageOrders.jsp").forward(request, response);
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
