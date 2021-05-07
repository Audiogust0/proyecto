<%-- 
    Document   : index
    Created on : 31-mar-2021, 17:26:04
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
                   body{
                        background-color: #ffdd90;
                        /*background-image: url("IMG/logo.png");*/
                        }
                </style>
                <form align="center"  method="post" action="controlador.do">
                        <br>
                        <img src="IMG/logotipo.png" height="30%" width="30%">
                        <font  face="Arial Black" color="62AEEA"><h1>LOGIN</h1></font>
                        <img src="IMG/user.svg" width="25" height="25" > <input type="text" name="usuario" placeholder="Usuario" >
                        <br>
                        <br>
                        <img src="IMG/5.jpg" width="25" height="25" > <input type="password" name="password" placeholder="Contraseña" > 
                        <br>
                        <br>
                        <button type="submit" name="opcion"  value="enviar" class="btn btn-primary btn-lg">Enviar</button>                     
                </form>
    </body>
</html>
