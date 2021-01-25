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
        <title>Bet.io | Usuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/assets/Apuestas.css" rel="stylesheet">
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
                            <a class="nav-link" aria-current="page" href="MainServlet?action=lista">Inicio</a>
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
                                    <a class="nav-link" aria-current="page" href="CategoriaServlet?action=lista">Categorías</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="ApuestaServlet?action=verPDF">Reporte apuestas abiertas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="UsuarioServlet?action=lista">Usuarios</a>
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
                                    <a class="nav-link" aria-current="page" href="/ProyectoFinal/UsuarioServlet?action=ingresar">Iniciar sesión</a>
                                </li>
                                <li>
                                    <a class="nav-link" aria-current="page" href="/ProyectoFinal/UsuarioServlet?action=registrar">Registrarme</a>
                                </li>
                            </c:if>
                        </ul>
                    </span>
                </div>
            </div>
        </nav>

            <div class="container">
                <div class="mt-3">
                    <a href="UsuarioServlet?action=lista">
                        <i class="bi bi-arrow-left-circle-fill"></i>
                        Regresar
                    </a>
                </div>
                <div class="row align-items-center justify-content-center">
                    <div class="col-6">
                        <div class="mt-3 d-flex justify-content-between">
                        <div>
                            <h1>
                                Información de usuario
                            </h1>
                        </div>
                        <div>
                            <a href="UsuarioServlet?action=eliminar&idUsuario=<c:out value="${dto.entidad.idUsuario}" />" class="delete-link">Eliminar</a>
                        </div>
                    </div>
                        <div class="card bg-light">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-6">
                                        Datos de Usuario
                                    </div>
                                    <div class="col-6 text-end">
                                        <c:out value="${cat.entidad.idUsuario}" />
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Alias Usuario
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.nombreUsuario}" />
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Nombre Usuario
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.nombre}" />
                                    </div>
                                </div>                        
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Apellido Paterno
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.paterno}" />
                                    </div>
                                </div>                        
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Email
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.email}" />
                                    </div>
                                </div>                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
