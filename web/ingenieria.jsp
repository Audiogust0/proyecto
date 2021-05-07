<%-- 
    Document   : ingenieria
    Created on : 11-abr-2021, 20:55:38
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Consultar Proyectos</h1>
        
        
        <form align="center" action="controlador.do">
        <div class="form-group d-flex">
            <div class="col-sm-6 ">
                <div class="container" align="center">
                <input type="text" name="nombre" value="" class="form-control" placeholder="Nombre Material"> 
                <button type="submit" name="opcion" value="BuscarProyecto" class="btn btn-outline-info">Buscar</button>
                </div>
           <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>OTIGA</th>
                                <th>NOMBRE</th>
                                <th>REGION</th>
                                <th>DIRECCION</th>
                                <th>LATITUD</th>
                                <th>LONGITUD</th>
                                <th>ELEVACION</th>
                                <th>TECNOLOGIA</th>
                                <th>UBICACION</th>
                                <th>FECHA</th>
                                <th>AUTORIZADO-POR</th>
                                <th>TIPO</th>
                                <th>SOLICITUD DE MATERIALES</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("nombre");
                             Proyecto objs = new Proyecto();
                             Vector usu = new Vector();
                             usu=objs.mostrarBusqueda(n);
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Proyecto)usu.get(i);
                             %>
                             <tr>
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getRegion()%></td>
                                <td><%= objs.getDireccion()%></td>
                                <td><%= objs.getLatitud()%></td>
                                <td><%= objs.getLongitud()%></td>
                                <td><%= objs.getElevacion()%></td>
                                <td><%= objs.getTecnologia()%></td>
                                <td><%= objs.getUbicacion()%></td>
                                <td><%= objs.getFecha()%></td>
                                <td><%= objs.getAutorizado()%></td>                                
                                <td><%= objs.getTipo()%></td>   
                                <td align="center" ><a href="Listado.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table> 
            
             </div>
        </div>
 </form>
        
    </body>
</html>
