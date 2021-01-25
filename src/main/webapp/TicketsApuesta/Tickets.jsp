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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/assets/Apuestas.css" rel="stylesheet">
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
                            <a class="nav-link" aria-current="page" href="ApuestaServlet?action=graficar">Inicio</a>
                        </li>
                        <c:if test="${sessionScope.nombreUsuario != null}">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
                            </li>
                            <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="TicketsServlet?action=lista">Tickets</a>
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
                <a href="/ProyectoFinal/MainServlet?action=lista"><i class="bi bi-arrow-left-circle-fill"></i> Regresar</a>
            </div>
            <div class="row gx-4">
                <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                    <div class="col-lg-12">
                    </c:if>
                    <c:if test="${sessionScope.tipoUsuario != 'ADMIN'}">
                        <div class="col-lg-9">
                        </c:if>
                        <h2>Tickets</h2>
                        <div class="d-flex justify-content-between">
                            <div class="">
                                <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                                    Aquí están los registros de todos los tickets ingresados por los usuarios.
                                </c:if>
                                <c:if test="${sessionScope.tipoUsuario != 'ADMIN'}">
                                    Aquí puedes ver las apuestas abiertas y puedas apostar en ellas.
                                </c:if>
                            </div>

                        </div>
                        <div class="row gx-4">
                            <c:forEach var="ticket" items="${tickets}">
                                <div class="col-lg-3">
                                    <div class="ticket-container">
                                        <c:if test="${ticket.entidad.determinada != 'GANADA'}">
                                            <div class="ticket-header d-flex justify-content-between">
                                            </c:if>
                                            <c:if test="${ticket.entidad.determinada == 'GANADA'}">
                                                <div class="ticket-header green d-flex justify-content-between">
                                                </c:if>

                                                <div>
                                                    Ticket No. <c:out value="${ticket.entidad.idTicket}" />
                                                </div>
                                                <div class="">
                                                    <c:out value="${ticket.entidad.determinada}" />
                                                </div>
                                            </div>
                                            <div class="ticket-body">
                                                <div class="ticket-label-name">
                                                    Evento
                                                </div>
                                                <div class="">
                                                    <c:forEach var="apuesta" items="${apuestas}">
                                                        <c:if test="${ticket.entidad.idApuesta == apuesta.entidad.idApuesta}">
                                                            <c:out value="${apuesta.entidad.nombreApuesta}" />
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <div style="font-weight: 500;">
                                                        Monto apostado
                                                    </div>
                                                    <div class="">
                                                        $<c:out value="${ticket.entidad.monto}" />
                                                    </div>
                                                </div>
                                                <c:if test="${sessionScope.tipoUduario != 'ADMIN'}">
                                                    <div class="mt-3">
                                                        <c:if test="${ticket.entidad.determinada == 'PENDIENTE'}">
                                                            <a href="TicketsServlet?action=elimina?idTicket=<c:out value="${ticket.entidad.idTicket}"/>">
                                                                <button class="btn cerrar-btn">
                                                                    Anular apuesta 
                                                                </button>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${ticket.entidad.determinada != 'PENDIENTE'}">
                                                            <button class="btn cerrar-btn disabled" disabled>
                                                                Anular apuesta 
                                                            </button>
                                                        </c:if>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
                <script>

                    const goToApostar = (id, tipo) => {

                        if (tipo === 'ADMIN') {
                            console.log(tipo);
                            window.location.replace(`/ProyectoFinal/ApuestaServlet?action=actualizar&idApuesta=` + id);
                        } else {
                            window.location.replace(`/ProyectoFinal/ApuestaServlet?action=hacerApuesta&idApuesta=` + id);
                        }

                    };
                    const test = (evento, fecha, idApuesta) => {
                        console.log(evento, fecha, idApuesta);
                    }
                </script>
                </body>
                </html>
