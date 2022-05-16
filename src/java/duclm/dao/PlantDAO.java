/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.dao;

import duclm.dto.Plant;
import duclm.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author leduc
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Plants.PName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id=rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid=rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, description, status, cateid, catename);
                        list.add(plant);
                    }
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
    
    public static Plant getPlantWithPID(String pid){
        Connection cn = null;
        Plant plant = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                        +"from Plants join Categories on Plants.CateID = Categories.CateID\n"
                        +"where status=1 and PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, pid);
                ResultSet rs = pst.executeQuery();
                if(rs !=null && rs.next()){
                    int PID = rs.getInt("PID");
                    String pname = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    plant = new Plant(PID, pname, price, imgPath, description, status, CateID, CateName);
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
        return plant;
    }

    public static Plant getPlant(int pid){
        Plant p = null;
        Connection cn = null;
        try{
            cn=DBUtils.makeConnection();
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as cateID, CateName\n"
                    +"from Plants, Categories \n"
                    +"where Plants.CateID=Categories.CateID and PID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if(rs!=null && rs.next()){
                pid = rs.getInt("PID");
                String pname = rs.getString("PName");
                int price = rs.getInt("price");
                String imgPath = rs.getString("imgPath");
                String des = rs.getString("description");
                int status = rs.getInt("status");
                int cateid = rs.getInt("cateID");
                String cateName = rs.getString("CateName");
                p = new Plant(pid, pname, price, imgPath, des, status, cateid, cateName);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            try {
                
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        return p;
    }
    
    public static HashMap<Integer,String> getCate(){
        HashMap<Integer,String> catelist = new HashMap<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "SELECT CateID, CateName\n"
                        +"from dbo.Categories\n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs !=null && rs.next()){
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    catelist.put(cateid, catename);
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
        return catelist;
    }
    
    public static boolean updatePlantStatus(int PID, int status){
        Connection cn = null;
        Plant p = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn!=null){
                String sql = "update Plants set status=? where PID =?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, PID);
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
    
    public static ArrayList<Plant> getPlantsTop3() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n"
                        + "WHERE PID IN (SELECT TOP 3 FID FROM OrderDetails GROUP BY FID ORDER BY SUM(quantity) DESC)";

                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs != null) {
                    while (rs.next()) {
                        int id=rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid=rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, description, status, cateid, catename);
                        list.add(plant);
                    }
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
}
