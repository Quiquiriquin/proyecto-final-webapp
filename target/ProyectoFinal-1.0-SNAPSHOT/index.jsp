<%-- 
    Document   : Login
    Created on : Jan 19, 2021, 6:39:00 PM
    Author     : enrique
--%>

<%@page import="com.ipn.mx.modelo.dto.UsuarioDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="com.ipn.mx.modelo.dto.GraficaDTO"%>
<%@page import="com.ipn.mx.modelo.dao.GraficaDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/Styles.css" rel="stylesheet">
    </head>
    <%
        Gson gsonObj = new Gson();
        Map<Object, Object> map = null;
        List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
        GraficaDAO dao = new GraficaDAO();
        List datos = dao.grafica();
        System.out.println(datos);
        if (datos != null) {
            for (int i = 0; i < datos.size(); i++) {
                GraficaDTO dto = (GraficaDTO) datos.get(i);
                map = new HashMap<Object, Object>();
                map.put("label", dto.getNombre());
                map.put("y", dto.getCantidad());
                list.add(map);
            }
        }

        String dataPoints = gsonObj.toJson(list);
    %>
    <script type="text/javascript">
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "light2",
                animationEnabled: true,
                title: {
                    text: "Cantidad de partidos por categoría",
                },
                data: [{
                        type: "pie",
                        toolTipContent: "<b>{label}</b>: {y}prod.",
                        indexLabelFontSize: 16,
                        indexLabel: "{label} - {y} partido.",
                        dataPoints: <%out.print(dataPoints);%>
                    }]
            });
            chart.render();

        }
    </script>
    <body>
        <%
            session = request.getSession(false);
            System.out.println(session.getAttribute("nombreUsuario"));
            if (session.getAttribute("nombreUsuario") == null) {
                response.sendRedirect("UsuarioServlet?action=ingresar");
            }
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
                            <a class="nav-link active" aria-current="page" href="MainServlet?action=lista">Inicio</a>
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
                                    <a class="nav-link" aria-current="page" href="ApuestaServlet?action=verPDF">Reporte de apuestas abiertas</a>
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
        <div class="container mt-4 mb-4">
            <div class="row gx-3">
                <div class="col-lg-6 col-sm-12">
                    <h1>¡Bienvendido ${sessionScope.nombreUsuario}!</h1>
                    <div class="">
                        Visualiza las métricas generales sin entrar a cada sección.
                    </div>
                    <div>
                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                    </div>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <div class="row">
                        <div class="col-lg-12 mt-3">
                            <div class="rounded-container orange">
                                <div class="box-title">
                                    Total apostado por los usuarios
                                </div>
                                <div class="data-info text-end">
                                    $<c:out value="${totalApostado}" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mt-3">
                            <div class="rounded-container green">
                                <div class="box-title">
                                    Apuestas ganadas
                                </div>
                                <div class="data-info text-end">
                                    <c:out value="${ganadas}" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mt-3">
                            <div class="rounded-container red">
                                <div class="box-title">
                                    Apuestas perdidas
                                </div>
                                <div class="data-info text-end">
                                    <c:out value="${perdidas}" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <div class="rounded-container blue">
                                <div class="box-title">
                                    Total de usuarios
                                </div>
                                <div class="data-info text-end">
                                    <c:out value="${usuariosTotales}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
