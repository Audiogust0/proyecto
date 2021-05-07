<%-- 
    Document   : MenuPrincipal
    Created on : 31-mar-2021, 22:18:16
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alecom</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">      
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
     <style>
           body {
                background-image: url("Imagenes/Fondo2.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;
                }
           .boton{
                 background-repeat:no-repeat;
                 height:200px;
                 width:200px;
                 background-position:center;
                 margin-right:14px!important;
                 }
        </style>
    <body>
        
        <%
            
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        

        if(sesion.getAttribute("usuario") !=null && sesion.getAttribute("nivel") ){
            usuario = sesion.getAttribute("usuario").toString();
            nivel = sesion.getAttribute("nivel").toString();
            
           out.print("<a href='index.jsp?cerrar=true'><h5>Cerrar Session "+ usuario +"</h5></a>");
        }
        
        %>
        
        
        <div align="center">
        <img src="IMG/logotipo.png" width="150" height="80" HSPACE="20">    
        </div>
        <br><br>
        <div>
            
            <form align="center" action="">
            <font color="#ffffff"><h2>MENU PRINCIPAL ADMINISTRADOR</h2></font><br>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Proyectos.jsp'"><img src="IMG/trabajar.svg" width="60" height="60"><br>Proyectos </button>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='ingenieria.jsp'"><img src="IMG/ingenieria.svg" width="60" height="60"><br>Ingenieria</button> 
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Almacen.jsp'"><img src="IMG/almacen.svg" width="60" height="60"><br>Almacen</button>  
                
            </form>
        </div>
    </body>
</html>
