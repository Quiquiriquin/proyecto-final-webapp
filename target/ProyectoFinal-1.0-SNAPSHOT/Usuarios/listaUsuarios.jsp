<%-- 
    Document   : listaUsuarios
    Created on : 20 ene 2021, 23:59:53
    Author     : Adrian
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
                    Bienvenido [Nombre de Admin xD]
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaServlet?accion=listaDeCategorias">Lista de Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaServlet?accion=nuevo">Lista de Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoServlet?action=lista">Lista de Apuestas</a>
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
                            class="rounded-table-border-right">Clave Categoría</th>
                        <th scope="col">Nombre Categoría</th>
                        <th scope="col">Descripción Categoría</th>                        
                        <th scope="col">Elimina </th>
                        <th scope="col">Actualiza </th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach 
                        var="usuarios" 
                        items="${listaDeUsuarios}">
                        <tr>
                            <td>
                                <a class="btn btn-primary btn-lg"
                                   href="UsuarioServlet?action=ver&idUsuario=<c:out value="${usuarios.entidad.idUsuario}"/>">
                                    <c:out value="${usuarios.entidad.idUsuario}"/>
                                </a>
                            </td>
                            <td> 
                                <c:out value="${usuarios.entidad.nombreUsuario}"/>
                            </td>
                            <td>
                                <c:out value="${usuarios.entidad.email}"/>
                            </td>
                            <td>
                                <a class="btn btn-danger btn-lg"
                                   href="UsuarioServlet?action=eliminar&idUsuario=<c:out value="${usuarios.entidad.idUsuario}"/>">
                                    Eliminar
                                </a>
                            </td>
                            <td>
                                <a class="btn btn-success btn-lg"
                                   href="UsuarioServlet?action=ver&idUsuario=<c:out value="${usuarios.entidad.idUsuario}"/>">
                                    Ver Datos
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