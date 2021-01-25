<%-- 
    Document   : listaCategorias
    Created on : 20 ene 2021, 21:28:12
    Author     : Adrian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Categorías</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/assets/Apuestas.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    </head>
    <body>
        

        <nav class="navbar navbar-expand-lg custom-navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Bet.io</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="ApuestaServlet?action=graficar">Inicio</a>
                        </li>
                        <c:if test="${sessionScope.nombreUsuario != null}">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
                            </li>

                            <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="TicketsServlet?action=lista">Tickets</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="CategoriaServlet?action=lista">Categorías</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="ApuestaServlet?action=verPDF">Reporte apuestas abiertas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=lista">Usuarios</a>
                                </li>
                            </c:if>

                        </c:if>
                        <!--                        <li class="nav-item">
                                                    <a class="nav-link" href="#">Features</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Pricing</a>
                                                </li>-->
                    </ul>
                    <span class="navbar-text">
                        <ul class="navbar-nav mb-lg-0">
                            <c:if test="${sessionScope.nombreUsuario != null}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <c:out value="${sessionScope.nombreUsuario}"></c:out>
                                        </a>
                                        <ul class="dropdown-menu" style="left: -45px" aria-labelledby="navbarDropdownMenuLink">
                                            <li><a class="dropdown-item" href="UsuarioServlet?action=perfil">Perfil</a></li>
                                            <li><a class="dropdown-item" href="UsuarioServlet?action=logout">Cerrar sesión</a></li>
                                        </ul>
                                    </li>
                            </c:if>

                            <c:if test="${sessionScope.nombreUsuario == null}">
                                <li>
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=ingresar">Iniciar sesión</a>
                                </li>
                                <li>
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=registrar">Registrarme</a>
                                </li>
                            </c:if>
                        </ul>
                    </span>
                </div>
            </div>
        </nav>



        <div class="container mt-5"> 
            <div class="d-flex justify-content-between">
                <h2 class="d-inline">Categorías</h2>
                <div class="">
                    <a class="btn btn-success w-100"
                       href="CategoriaServlet?action=nuevo">
                        Agregar categoría
                    </a>
                </div>
            </div>
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
                        var="categorias" 
                        items="${listaDeCategorias}">
                        <tr>
                            <td>
                                <c:out value="${categorias.entidad.idCategoria}"/>
                            </td>
                            <td> 
                                <c:out value="${categorias.entidad.nombreCategoria}"/>
                            </td>
                            <td>
                                <c:out value="${categorias.entidad.descripcionCategoria}"/>
                            </td>
                            <td>
                                <a class=""
                                   data-bs-toggle="tooltip" data-bs-placement="right" title="Tooltip on right"
                                   href="CategoriaServlet?action=eliminar&idCategoria=<c:out value="${categorias.entidad.idCategoria}"/>">
                                    <i class="bi bi-x-circle-fill"></i>
                                </a>
                            </td>
                            <td>
                                <a class=""
                                   data-bs-toggle="tooltip" data-bs-placement="right" title="Tooltip on right"
                                   href="CategoriaServlet?action=actualizar&idCategoria=<c:out value="${categorias.entidad.idCategoria}"/>">
                                    <i class="bi bi-pencil-square"></i>
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