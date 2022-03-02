
package project;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import project.ConnectionProvider;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

@MultipartConfig
@WebServlet("/addNewProductsAction")
public class addNewProductsAction extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String id=request.getParameter("id");
           String name=request.getParameter("name");
           String authorName=request.getParameter("authorName");
           String description=request.getParameter("description");
           String category=request.getParameter("category");
           String price=request.getParameter("price");
           String stock=request.getParameter("stock");
           String active=request.getParameter("active");
           
           
           Part part=request.getPart("photo");
  
          ConnectionProvider c=new ConnectionProvider();
          Connection con=c.getCon();
          
          PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?)");
          ps.setString(1, id);
          ps.setString(2, name);
          ps.setString(3, authorName);
          ps.setString(4, description);
          ps.setString(5, part.getSubmittedFileName());
          ps.setString(6, category);
          ps.setString(7, price);
          ps.setString(8, stock);
          ps.setString(9, active);
          ps.executeUpdate();
          
          //pic upload
          
          //find out the path to upload the photo
          String path=request.getRealPath("img")+File.separator+"books"+File.separator+part.getSubmittedFileName();
            System.out.println(path);
          
          //uploading code
          FileOutputStream fos=new FileOutputStream(path);
            InputStream is=part.getInputStream();
            
            
            //reading data
            byte []data=new byte[is.available()];
            is.read(data);
            
            
            //writing data to fos
            fos.write(data);
            
            fos.close();
            
            
          response.sendRedirect("admin/addNewProduct.jsp?msg=done");
      
           
        }
        catch(Exception e){
           response.sendRedirect("admin/addNewProduct.jsp?msg=wrong"); 
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addNewProductsAction.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addNewProductsAction.class.getName()).log(Level.SEVERE, null, ex);
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
