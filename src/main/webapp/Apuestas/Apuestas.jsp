<%-- 
    Document   : Login
    Created on : Jan 19, 2021, 6:39:00 PM
    Author     : enrique
--%>

<%@page import="com.ipn.mx.modelo.dto.UsuarioDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Apuestas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link href="./assets/Apuestas.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    </head>
    <body>
        <%
            session = request.getSession(false);
            System.out.println(session.getAttribute("nombreUsuario"));
        %>
        <nav class="navbar navbar-expand-lg custom-navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Bet.io</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="/ProyectoFinal">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
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
        <div class="container-fluid mt-3 min-full">
            <div class="mb-3">
                <a href="/ProyectoFinal"><i class="bi bi-arrow-left-circle-fill"></i> Regresar</a>
            </div>
            <h2>Apuestas</h2>
            <div class="">
                Aquí puedes ver las apuestas abiertas y puedas apostar en ellas.
            </div>
            <div class="row gx-5">
                <div class="col-lg-9 col-sm-12 pe-3">
                    <div class="row gx-4">
                        <c:forEach var="apuesta" items="${apuestas}">
                            <div class="col-lg-6 col-md-12 mt-3">
                                <div class="apuesta-container" onclick="test('${apuesta.getEntidad().getNombreApuesta()}', '${apuesta.getEntidad().getFecha()}', '${apuesta.getEntidad().getIdApuesta()}')">
                                    <div>
                                        <div class="">
                                            <c:out value="${apuesta.getEntidad().getNombreApuesta()}"></c:out>
                                        </div>
                                        <div class="gray-font" style="color: #8c8c8c; font-weight: 300;">
                                            <c:out value="${apuesta.getEntidad().getDescripcionApuesta()}"></c:out>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="fecha-label">
                                            Fecha
                                        </div>
                                        <div class="">
                                            <c:out value="${apuesta.getEntidad().getFecha()}"></c:out>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="text-center">
                        <h3>Selecciona una apuesta</h3>
                        <div class="">
                            Al hacer click en alguna apuesta, podrás establecer el monto para tu apuesta e ingresarla al sistema.
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            
            const test = (evento, fecha, idApuesta) => {
                console.log(evento, fecha, idApuesta);
            }
        </script>
            
    </body>
</html>
