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
        <title>Bet.io | Login</title>
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
                            <a class="nav-link" aria-current="page" href="#">Inicio</a>
                        </li>
                        <!--                        <li class="nav-item">
                                                    <a class="nav-link" href="#">Features</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Pricing</a>
                                                </li>-->
                    </ul>
                    <span class="navbar-text">
                        <ul class="navbar-nav mb-lg-0">
                            <li>
                                <a class="nav-link active" aria-current="page" href="/ProyectoFinal/UsuarioServlet?action=ingresar">Iniciar sesión</a>
                            </li>
                            <li>
                                <a class="nav-link" aria-current="page" href="/ProyectoFinal/UsuarioServlet?action=registrar">Registrarme</a>
                            </li>

                        </ul>
                    </span>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="login-card">
                <div class="login-title">
                    Iniciar sesión
                </div>
                <div class="login-content">
                    <form method="POST" action="UsuarioServlet?action=login">
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
                                type="password"
                                name="claveUsuario"
                                class="form-control"
                                id="claveUsuario"
                                placeholder="******"
                                >
                        </div>
                        <button type="submit" class="btn accept-button w-100">
                            Ingresar
                        </button>
                        <div class="mt-4 fz-14 text-center">
                            ¿Aún no tienes cuenta en Bet.io? <a href="/ProyectoFinal/UsuarioServlet?action=registrar">Regístrate aquí</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
