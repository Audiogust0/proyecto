<%-- 
    Document   : Almacen
    Created on : 31-mar-2021, 22:25:04
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
          <img src="IMG/logo.PNG" width="150" height="80" HSPACE="20">
            <form align="center" action="">
            <font color="#ffffff"><h2>MENU Almacen</h2></font>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Consulta.jsp'"><img src="IMG/almacen.svg" width="60" height="60"><br>Consulta por codigo </button>
                        
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Tabla.jsp'"><img src="IMG/almacen.svg" width="60" height="60"><br>Tabla</button>
                        
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='consultaSolicitud.jsp'"><img src="IMG/solicitud.svg" width="60" height="60"><br>Consultar Solicitud de Materiales</button>
                        
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='SolicitudMaterial.jsp'"><img src="IMG/solicitud.svg" width="60" height="60"><br>Devolucion de Materiales</button>                
            </form>
    </body>
</html>
