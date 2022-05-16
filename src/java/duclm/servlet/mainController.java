/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leduc
 */
public class mainController extends HttpServlet {
    private String url ="indexServlet";
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
            String action = request.getParameter("action");
            if(action==null || action.equals("")){
                url="indexServlet";
            } else if (action.equals("Search")){
                url="searchServlet";
            } else if (action.equals("Login")){
                url="loginServlet";
            } else if (action.equals("Register")){
                url="registerServlet";
            } else if (action.equals("logout")){
                url="logoutServlet";
            } else if (action.equals("completedOrder") || action.equals("canceledOrder") || action.equals("processingOrder")){
                url="viewOrderServlet";
            } else if (action.equals("allOrder")){
                url="allOrderServlet";
            } else if (action.equals("Change profile")){
                url="changeProfile";
            } else if (action.equals("addtocart")){
                url="addToCartServlet";
            } else if (action.equals("viewcart")){
                url="viewCartServlet";
            } else if (action.equals("update")){
                url="updateCartServlet";
            } else if (action.equals("delete")){
                url="deleteFromCartServlet";
            } else if (action.equals("saveOrder")){
                url="saveShoppingCartServlet";
            } else if (action.equals("Search Date")){
                url="searchDateServlet";
            } else if (action.equals("manageAccounts")){
                url="manageAccountsServlet";
            } else if (action.equals("updateStatusAccount")){
                url="updateStatusAccountServlet";
            } else if (action.equals("Search account")){
                url="searchAccountServlet";
            } else if (action.equals("manageOrders")){
                url="manageOrdersServlet";
            } else if (action.equals("managePlants")){
                url="managePlantsServlet";
            } else if (action.equals("manageCategories")){
                url="manageCategoriesServlet";
            } else if (action.equals("Search By Date")){
                url="searchOrderAdminServlet";
            } else if (action.equals("changePlantStatus")){
                url="changePlantStatusServlet";
            } else if (action.equals("orderDetail")){
                url="orderDetailServlet";
            } 
            
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
