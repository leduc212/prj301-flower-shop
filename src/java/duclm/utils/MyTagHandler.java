/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duclm.utils;

import java.util.Calendar;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author leduc
 */
public class MyTagHandler extends TagSupport {
    private String name;

    public void setName(String name) {
        this.name = name;
    }
    
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();//returns the instance of JspWriter  
        try {
            out.print("<p class='text-dark' style='font-size: 150%'>User: "+name+"</p>"); 
            out.println("<a href='mainController?action=logout' class='btn btn-info text-center'>Logout</a>");
        } catch (Exception e) {
            System.out.println(e);
        }
        return SKIP_BODY;//will not evaluate the body content of the tag  
    }
}
