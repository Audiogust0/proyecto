<%-- 
    Document   : consultaSolicitud
    Created on : 21-abr-2021, 10:32:25
    Author     : Hp
--%>

<%@page import="Modelo.Material"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Consultar solicitudes de Materiales</h1>
        
    <center>
        <form align="center" action="controlador.do">
        <div class="form-group d-flex">
            <div class="col-sm-6 ">
                
                <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>

           <br>
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>id</th>
                                <th>otiga</th>
                                <th>Nombre</th>
                                <th>Unidad</th>
                                <th>Existencia</th>
                                <th>Solicitado</th>                             
                                <th>Solicitar</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("codigo");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             
                             Vector usu = new Vector();
                             usu=objs.mostrarBusqueda(n);                           
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(MaterialSolicitado)usu.get(i);
                               
                             %>
                             <tr>
                                <td><%= objs.getId() %></td>
                                <td><%= objs.getOtiga()%></td>
                                <td><input type="text" name="nombresM" value="<%= objs.getNombre()%>" disable></td>
                                <td><%= objs.getUnidades()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getSolicitado()%></td>                              
                             
                                <td><input class="formulario__campo" type="number" name="solicitudes"   placeholder="Cantidad" min="0" max="<%= objs.getExistencia()%>" ></td>
                             </tr>
                                <%}%>                                                         
                </table>
                            <button type="submit" name="opcion" value="enviarAlmacen" class="btn btn-success">Enviar</button>
             </div>
        </div>
 </form>
                                </center>        
    </body>
</html>
