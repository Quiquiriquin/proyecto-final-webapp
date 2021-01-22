<%-- 
    Document   : nuevaApuesta
    Created on : 21 ene 2021, 23:37:56
    Author     : frida
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container"> 
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <img src="imagenes/LogoEscom.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
                    Bienvenido [Nombre de usuario xD]
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../CategoriaServlet?accion=listaDeCategorias">Mis Apuestas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ApuestaServlet?accion=ApostarAqui">Apuesta Aqui</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../ApuestaServlet?accion=listaDeApuestas">Ganancias</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                MI perfil
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Configuración</a>
                                <a class="dropdown-item" href="#">Aviso de Privacidad</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Cerrar Sesión</a>
                            </div>
                        </li>

                    </ul>
                </div>
            </nav>
            <table class="table table-hover">
                <thead >
                    <tr>
                        <th 
                            scope="col"
                            style="border-top-right-radius: 10px; borde-top: none;"
                            class="rounded-table-border-right">Clave Apuesta</th>
                        <th scope="col">Nombre Apuesta</th>
                        <th scope="col">Descripción Apuesta</th>                        
                        <th scope="col">Ver Apuesta </th>
                        <th scope="col">Apostar </th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach 
                        var="apuestas" 
                        items="${listaDeApuestas}">
                        <tr>
                            <td>
                                <a class="btn btn-lg btn-lg"
                                   href="ApuestaServlet?accion=ver&idApuesta=<c:out value="${apuestas.entidad.idApuesta}"/>">
                                    <c:out value="${apuestas.entidad.idApuesta}"/>
                                </a>
                            </td>
                            <td> 
                                <c:out value="${apuestas.entidad.nombreApuesta}"/>
                            </td>
                            <td>
                                <c:out value="${apuestas.entidad.descripcionApuesta}"/>
                            </td>
                            <td>
                                <a class="btn btn-primary btn-lg"
                                   href="ApuestaServlet?accion=verUsuario&idApuesta=<c:out value="${apuestas.entidad.idApuesta}"/>">
                                    Ver
                                </a>
                            </td>
                            <td>
                                <a class="btn btn-success btn-lg"
                                   href="ApuestaServlet?accion=hacerApuesta&idApuesta<c:out value="${apuestas.entidad.idApuesta}"/>">
                                    Apostar
                                </a> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
