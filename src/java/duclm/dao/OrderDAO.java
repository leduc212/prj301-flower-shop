/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.dao;

import duclm.dto.Order;
import duclm.dto.OrderDetail;
import duclm.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author leduc
 */
public class OrderDAO {
    
    public static ArrayList<Order> getOrders(){
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        Order ord = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "SELECT OrderID,OrdDate,shipdate,status,AccID\n"
                        +"from dbo.Orders\n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs !=null && rs.next()){
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accid = rs.getInt("AccID");
                    ord = new Order(orderID, orderDate, shipdate, status, accid);
                    list.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    public static ArrayList<Order> getOrders(String email){
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "SELECT OrderID,OrdDate,shipdate,dbo.Orders.status,dbo.Orders.AccID\n"
                        +"from dbo.Orders join dbo.Accounts on dbo.Orders.AccID = dbo.Accounts.accID\n"
                        +"where dbo.Accounts.email=? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while(rs !=null && rs.next()){
                    int OrderID = rs.getInt("OrderID");
                    String OrderDate = rs.getString("OrdDate");
                    String ShipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int AccID = rs.getInt("AccID");
                    order = new Order(OrderID, OrderDate, ShipDate, status, AccID);
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    
    public static ArrayList<OrderDetail> getOrderDetail(int orderID){
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "SELECT DetailId, OrderID,PID,PName,price,imgPath,quantity\n"
                        +"from dbo.OrderDetails join Plants on OrderDetails.FID = Plants.PID\n"
                        +"where OrderID=? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                while(rs !=null && rs.next()){
                    int detailID = rs.getInt("DetailId");
                    int PlantID = rs.getInt("PID");
                    String PlantName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    int quantity = rs.getInt("quantity");
                    OrderDetail orderdetail = new OrderDetail(detailID, orderID, PlantID, PlantName, price, imgPath, quantity);
                    list.add(orderdetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    
    public static boolean updateOrderStatus(int orderID, int status){
        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "update Orders set status=? where OrderID =?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
                pst.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn!=null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static boolean insertOrder(String email, HashMap<String,Integer> cart){
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                int accid=0,orderid=0;
                cn.setAutoCommit(false);//off auto commit
                //get account id by email
                String sql = "select accID from Accounts where Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if(rs!=null && rs.next()) accid=rs.getInt("accID");
                //insert a new order
                System.out.println("accountid: "+accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("Order date: "+d);
                sql = "insert Orders(OrdDate,status,AccID) values(?,?,?)";
                pst=cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the largest number
                sql = "select top 1 orderID from Orders order by orderID desc";
                pst=cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs!=null &&rs.next()) orderid = rs.getInt("orderID");
                //insert order details
                System.out.println("orderid: "+orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    pst=cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Ko chen order dc");
            }
        } catch (Exception e) {
            try{
                if(cn!=null) cn.rollback();
            } catch(SQLException ex){
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            if (cn!=null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } return result;
    } 
}
