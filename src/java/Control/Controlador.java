/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Conexion;
import Modelo.Material;
import Modelo.MaterialSolicitado;
import Modelo.Proyecto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;


/**
 *
 * @author Hp
 */
public class Controlador extends HttpServlet {

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
        
         String opcion = request.getParameter("opcion");
       if (opcion.equals("enviar")) {
                Connection c = Conexion.conectar();
                try {
                    
                    String usuario = request.getParameter("usuario");
                    String password = request.getParameter("password");
                    
                   
                    if (c != null) {

                        PreparedStatement ps = c.prepareStatement("select * from usuarios where usuario=? and contrasena=?");
                        ps.setString(1, usuario);
                        ps.setString(2, password);
                        ResultSet rs = ps.executeQuery();
                        HttpSession sesion = request.getSession();
                        if (rs.next()) {
                            int t = rs.getInt("tipo");
                            switch (t) {
                                case 1:
                                    
                                    sesion.setAttribute("user", usuario);
                                    sesion.setAttribute("nivel", "1");
                                    request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
                                    break;
                                case 2:
                                    request.getRequestDispatcher("MenuPrincipal_1.jsp").forward(request, response);
                                    break;
                                case 3:
                                    request.getRequestDispatcher("MenuPrincipal_2.jsp").forward(request, response);
                                    break;
                            }
                        } else {                 
                            System.out.println("Usuario o Password Incorrecta!");

                        }
                    } else {                     
                        System.out.println("No hay conexion a la base");
                    }
                } catch (Exception e) {                  
                    System.out.println(e);
                }
            }
       
       if (opcion.equals("BuscarSolicitud")) {
                MaterialSolicitado ms = new MaterialSolicitado();
                
               request.getRequestDispatcher("consultaSolicitud.jsp").forward(request, response);
                               
            }
            
            if (opcion.equals("enviarDatos")) {
               Material m = new Material();
               Material m1 = new Material();
               String ar[] = request.getParameterValues("numeros");
               String arr[] = request.getParameterValues("cod");
               String otiga = request.getParameter("otiga");               
            for (int i = 0; i < ar.length; i++) {
                    if (ar[i].length() > 0) {
                    String descripciones = m.Descripcion(arr[i]);
                    m1.Pedidos(otiga, descripciones, ar[i]);
                    System.out.println(arr[i]+"  || "+ar[i]);    
                    }                    
                }               
                
            }
            if (opcion.equals("enviarAlmacen")) {
                MaterialSolicitado mat = new MaterialSolicitado();
                String soli[] = request.getParameterValues("solicitudes");
                String nombres[] = request.getParameterValues("nombresM");
                for (int i = 0; i < soli.length; i++) {
                    String nom=mat.Operacion(nombres[i],Integer.parseInt(soli[i]));
                    System.out.println(nom);
                    System.out.println(soli[i]+""+nombres[i]);
                }
            }
              
             if (opcion.equals("BuscarProyecto")) {
                 request.getRequestDispatcher("ingenieria.jsp").forward(request, response);  
             }  
             
              
            if (opcion.equals("enviarProyecto")) {
                    String otiga="";
                    
                    String nombre = request.getParameter("nombre");
                    String region = request.getParameter("region");
                    String direccion = request.getParameter("direccion");
                    String latitud = request.getParameter("latitud");
                    String longitud = request.getParameter("longitud");
                    String elevacion = request.getParameter("elevacion");
                    String tecnologia = request.getParameter("tecnologia");
                    String ubicacion = request.getParameter("ubicacion");
                    String fecha = request.getParameter("i_fecha");                    
                    String autoriza = request.getParameter("i_autorizado");
                    String otigon = request.getParameter("otigon");
                    String tipo = request.getParameter("tipoPro");
                    
   if (nombre.equals("") || region.equals("") || region.equals("") || 
       direccion.equals("") || latitud.equals("") || longitud.equals("") || 
        elevacion.equals("") || tecnologia.equals("") || ubicacion.equals("") ||
        fecha.equals("") || autoriza.equals("") || tipo.equals("")) {
                    
    request.getRequestDispatcher("Error.jsp").forward(request, response);    
   }else{
       
       if (tipo.equals("donado")) {
           otiga += "Do";
       }else{
           otiga += "Fs";
       }
       otiga +="_"+nombre;
       otiga +=fecha;
       otiga +=otigon;
       
                System.out.println(tipo);
        /* DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");          
         LocalDate ahora = LocalDate.now();
          
           otiga += nombre;
           otiga += ahora;
          */ 
        
      Date fechad = new Date(Calendar.getInstance().getTimeInMillis());
        
       Proyecto p = new Proyecto();
       
       p.setOtiga(otiga);
       p.setNombre(nombre);
       p.setRegion(region);
       p.setDireccion(direccion);
       p.setLatitud(latitud);
       p.setLongitud(longitud);
       p.setElevacion(elevacion);
       p.setTecnologia(tecnologia);
       p.setUbicacion(ubicacion);
       p.setFecha(fecha);
       p.setAutorizado(autoriza);
       p.setTipo(tipo);
                     
       p.guardar();
                   
       HttpSession sesion = request.getSession(true);
       sesion.setAttribute("res0", nombre);
       sesion.setAttribute("res1", otiga);
       request.getRequestDispatcher("Exito.jsp").forward(request, response);
   }
                    
                    
            }
             if (opcion.equals("BuscarMaterial")) {
                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
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
