<%-- 
    Document   : Login
    Created on : Jan 19, 2021, 6:39:00 PM
    Author     : enrique
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Perfil</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link href="./assets/Login.css" rel="stylesheet">
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
                                    <a class="nav-link" aria-current="page" href="CategoriaServlet?action=lista">Categorías</a>
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
                                    <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
        <div class="container mt-3">
            <div class="mb-3">
                <a href="/ProyectoFinal/MainServlet?action=lista"><i class="bi bi-arrow-left-circle-fill"></i> Regresar</a>
            </div>
            <div>
                <div class="w-50 mx-auto">
                    <h2 class="black-font">Hola <c:out value="${sessionScope.nombreUsuario}"></c:out></h2>  
                        <div class="fz-14">
                            En esta sección podrás modificar tu información básica.
                            Si realizas alguna modificación <br />¡No olvides guardar los cambios antes de salir!
                        </div>
                        <div class="login-content mt-3">
                            <form method="POST" action="UsuarioServlet?action=almacenar">                        
                                <div class="mb-3">
                                    <input type="hidden" name="idUsuario" value="${usuario.getEntidad().getIdUsuario()}"/>
                                <div class="row gx-2">
                                    <div class="col-lg-6 col-sm-12">
                                        <label
                                            for="exampleInputEmail1"
                                            class="form-label">
                                            Nombre
                                        </label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="nombre"
                                            name="nombre"
                                            aria-describedby="emailHelp"
                                            placeholder="Juan"
                                            value="${usuario.getEntidad().getNombre()}"
                                            >
                                    </div>
                                    <div class="col-lg-6 col-sm-12">
                                        <label
                                            for="exampleInputEmail1"
                                            class="form-label">
                                            Apellido
                                        </label>
                                        <input
                                            type="text"
                                            name="paterno"
                                            class="form-control"
                                            id="paterno"
                                            aria-describedby="emailHelp"
                                            placeholder="Hernández"
                                            value="${usuario.getEntidad().getPaterno()}"
                                            >
                                    </div>
                                </div>
                            </div>


                            <div class="mb-3">
                                <label
                                    for="exampleInputEmail1"
                                    class="form-label">
                                    Usuario
                                </label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="nombreUsuario"
                                    name="nombreUsuario"
                                    aria-describedby="emailHelp"
                                    placeholder="juan@gmail.com"
                                    value="${usuario.getEntidad().getNombreUsuario()}"
                                    >
                            </div>


                            <div class="mb-3">
                                <label
                                    for="exampleInputEmail1"
                                    class="form-label">
                                    Correo electrónico
                                </label>
                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    name="email"
                                    aria-describedby="emailHelp"
                                    placeholder="juan@gmail.com"
                                    value="${usuario.getEntidad().getEmail()}"
                                    >
                            </div>



                            <button type="submit" class="btn accept-button w-100">
                                Actualizar
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
