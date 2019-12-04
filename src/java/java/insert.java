/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aldyth M. V. Nahak (672017081)
 */
@WebServlet(name = "insert", urlPatterns = {"/insert"})
public class insert extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String id=request.getParameter("id");
           String nama=request.getParameter("nama");
           String harga=request.getParameter("harga");
           String stok=request.getParameter("stok");
           try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");
               Statement stmt = con.createStatement();
               
               PreparedStatement ps = con.prepareStatement("insert into `makanan`(id,nama,harga,stok) values(?,?,?,?)");
               ps.setString(1, id);
               ps.setString(2, nama);
               ps.setString(3, harga);
               ps.setString(4, stok);
               ps.executeUpdate();
               response.sendRedirect("makanan.jsp");
               
           } catch (Exception e){
               
           }
        }
    }

}
