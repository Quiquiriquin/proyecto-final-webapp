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
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link href="./assets/Login.css" rel="stylesheet">

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

                            <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="TicketsServlet?action=lista">Tickets</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="CategoriaServlet?action=lista">Categorías</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="ApuestaServlet?action=verPDF">Reporte apuestas abiertas</a>
                            </li>
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
                                    <a class="nav-link active" aria-current="page" href="/ProyectoFinal/UsuarioServlet?action=registrar">Registrarme</a>
                                </li>
                            </c:if>
                        </ul>
                    </span>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="login-card">
                <div class="login-title">
                    Regístrate
                </div>
                <div class="login-content">
                    <form method="POST" action="UsuarioServlet?action=almacenar">                        
                        <div class="mb-3">
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
                                        >
                                </div>
                            </div>
                        </div>

                        <!-- <div class="mb-3">
                            <div class="row gx-2">
                                <div class="col-lg-6 col-sm-12">
                                    <label
                                        for="exampleInputEmail1"
                                        class="form-label">
                                        Estado
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="estado"
                                        name="estado"
                                        aria-describedby="emailHelp"
                                        placeholder=""
                                        >
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <label
                                        for="exampleInputEmail1"
                                        class="form-label">
                                        Municipio
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="estado"
                                        name="municipio"
                                        aria-describedby="emailHelp"
                                        placeholder=""
                                        >
                                </div>
                            </div>
                        </div>
                        
                        -->

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
                                placeholder=""
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
                                >
                        </div>


                        <div class="mb-3">
                            <label
                                for="exampleInputEmail1"
                                class="form-label">
                                Contraseña
                            </label>
                            <input
                                name="claveUsuario"
                                type="password"
                                class="form-control"
                                id="claveUsuario"
                                >
                        </div>
                        <button type="submit" class="btn accept-button w-100">
                            Registrar
                        </button>
                        <div class="mt-4 fz-14 text-center">
                            ¿Ya tienes cuenta en Bet.io? <a href="/ProyectoFinal/UsuarioServlet?action=ingresar">Inicia sesión aquí</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
