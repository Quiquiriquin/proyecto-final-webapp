<%-- 
    Document   : verUsuario
    Created on : 22 ene 2021, 0:01:58
    Author     : frida
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Apostar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link href="./assets/Login.css" rel="stylesheet">
        <link href="./assets/Apuestas.css" rel="stylesheet">
    </head>
    <body>

        <style>
            .login-card {
                max-width: 35%;
                margin: 25px auto 0 auto;
                border:1px solid #E3E3E3;
                border-radius: 5px;
                padding: 25px 40px;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            }

            .login-title {
                font-size: 2em;
                font-weight: 500;
            }

            .cancel-gray-button {
                background: #DDDDDD !important;
            }
        </style>


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
                                <a class="nav-link active" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
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


        <div class="container">
            <div class="mt-3">
                <a href="ApuestaServlet?action=lista">
                    <i class="fa fa-arrow-left"></i>
                    Regresar
                </a>
            </div>
            <div class="row align-items-center justify-content-center">

                <div class="col-6">
                    <div class="mt-3">
                        <h1>
                            Apuesta
                        </h1>
                        <div class="mb-2">
                            Establece el monto y el equipo ganador
                        </div>
                    </div>
                    <div class="card ">
                        <div class="card-header" style="background: #DDDDDD;">
                            <div class="row" >
                                <div class="col-6">
                                    Datos de tu Apuesta
                                </div>
                                <div class="col-6 text-end">
                                    ID de partido: <c:out value="${apuesta.entidad.idApuesta}" />
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="ApuestaServlet?action=apostar" >
                                <input name="idApuesta" id="idApuesta" type="hidden" value="<c:out value="${apuesta.entidad.idApuesta}" />" />
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Nombre de Apuesta
                                    </label>
                                    <input 
                                        readonly
                                        type="text" 
                                        class="form-control" 
                                        id="nombreApuesta" 
                                        name="nombreApuesta"
                                        placeholder="Nombre nueva Apuesta"
                                        required
                                        value="<c:out value="${apuesta.entidad.nombreApuesta}" />"
                                        >
                                </div>

                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Descripción de Apuesta
                                    </label>
                                    <input 
                                        readonly
                                        type="text" 
                                        class="form-control" 
                                        id="descripcionApuesta" 
                                        name="descripcionApuesta"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${apuesta.entidad.descripcionApuesta}" />"
                                        >
                                </div>
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Ganador de tu Apuesta
                                    </label>
                                    <select name="ganador" class="form-select">
                                        <c:set var="equipos" value="${apuesta.entidad.equipo1},${apuesta.entidad.equipo2}" />
                                        <c:forEach var="option" items="${equipos}">
                                            <option value="${option}"><c:out value="${option}" /></option>
                                        </c:forEach>
                                    </select>                  
                                </div>
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Monto de Apuesta
                                    </label>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">$</span>
                                        <input 
                                            prefix="$"
                                            type="text" 
                                            min="10"
                                            class="form-control" 
                                            id="montoApuesta" 
                                            name="montoApuesta"
                                            required
                                            >
                                    </div>
                                </div>                                                  
                                <div class="row mt-3">
                                    <div class="col-6">
                                        <a href="ApuestaServlet?action=lista">
                                            <button type="button" class="btn cancel-gray-button">
                                                Cancelar
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-6 text-end">
                                        <button type="submit" class="btn accept-button">
                                            Apostar
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.min.js"></script>
    </body>
</html>

