<%-- 
    Document   : apuestaForm
    Created on : 21 ene 2021, 0:55:05
    Author     : Adrian
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
                <a href="ApuestaServlet?action=lista">
                    <i class="bi bi-arrow-left-circle-fill"></i>
                    Regresar
                </a>
            </div>






            <div class="row align-items-center justify-content-center">
                <div class="col-6">
                    <div class="mt-3 d-flex justify-content-between">
                        <div>
                            <h1>
                                <c:if test = "${dto.entidad.idApuesta != null}">
                                    Actualizar Apuesta
                                </c:if>
                                <c:if test = "${dto.entidad.idApuesta == null}">
                                    Crear Apuesta
                                </c:if>
                            </h1>
                        </div>
                        <div>
                            <a href="ApuestaServlet?action=eliminar&idApuesta=<c:out value="${dto.entidad.idApuesta}" />" class="delete-link">Eliminar</a>
                        </div>
                    </div>
                    <div class="card ">
                        <div class="card-header" style="background: #DDDDDD;">
                            <div class="row" >
                                <div class="col-6">
                                    Datos de tu Apuesta
                                </div>

                                <div class="col-6 text-end">
                                    <c:if test="${dto.entidad.idApuesta != null}">
                                        Apuesta número <c:out value="${apuesta.entidad.idApuesta}" />
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="ApuestaServlet?action=guardar" >
                                <input name="idApuesta" id="idApuesta" type="hidden" value="<c:out value="${dto.entidad.idApuesta}" />" />
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Nombre de Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="nombreApuesta" 
                                        name="nombreApuesta"
                                        placeholder="Nombre nueva Apuesta"
                                        required
                                        value="<c:out value="${dto.entidad.nombreApuesta}" />"
                                        >
                                </div>

                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Descripción de Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="descripcionApuesta" 
                                        name="descripcionApuesta"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${dto.entidad.descripcionApuesta}" />"
                                        >
                                </div>
                                <div class="mb-2">
                                    <div class="row gx-3">
                                        <div class="col-lg-6 col-sm-12">
                                            <label class="form-label mini">
                                                Equipo local
                                            </label>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="equipo1" 
                                                name="equipo1"
                                                placeholder=""
                                                required
                                                value="<c:out value="${dto.entidad.equipo1}" />"
                                                >
                                        </div>
                                        <div class="col-lg-6 col-sm-12">
                                            <label class="form-label mini">
                                                Equipo visitante
                                            </label>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="equipo2" 
                                                name="equipo2"
                                                placeholder=""
                                                required
                                                value="<c:out value="${dto.entidad.equipo2}" />"
                                                >
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-2">
                                    <c:if test="${dto.entidad.idCategoria == null}">
                                        <label class="form-label mini">
                                            Categoría
                                        </label>
                                        <select
                                            class="form-select"
                                            id="idCategoria"
                                            name="idCategoria"
                                            placeholder="Selecciona..."
                                            value="<c:out value="${dto.entidad.fecha}" />"
                                            aria-label="Default select example">
                                            <c:forEach var="option" items="${categorias}">
                                                <option
                                                    selected="<c:if test="${ option.entidad.idCategoria == dto.entidad.idCategoria }">"true"</c:if>"
                                                    value="<c:out value="${option.entidad.idCategoria}" />">
                                                    <c:out value="${option.entidad.nombreCategoria}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${dto.entidad.idCategoria != null}">                                        
                                        <input 
                                            type="hidden"                                            
                                            class="form-select"
                                            id="idCategoria"
                                            name="idCategoria"
                                            placeholder="Selecciona..."
                                            value="<c:out value="${dto.entidad.idCategoria}" />"
                                            >

                                    </c:if>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-2">
                                            <label class="form-label mini">
                                                Momio de apuesta
                                            </label>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="momio" 
                                                name="momio"
                                                placeholder=""
                                                required
                                                value="<c:out value="${dto.entidad.momio}" />"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="form-label mini">
                                            Status Apuesta
                                        </label>
                                        <c:out value="${dto.entidad.status}" />
                                        <select
                                            class="form-select"
                                            id="status"
                                            name="status"
                                            placeholder="Selecciona Status..."                                        
                                            aria-label="Default select example"
                                            value="<c:out value="${dto.entidad.status}" />"

                                            >             
                                            <c:if test="${dto.entidad.status == 'ABIERTA'}">
                                                <option                                                
                                                    value="ABIERTA" selected/>
                                            </c:if>
                                            <c:if test="${dto.entidad.status == 'CERRADA' || !dto.entidad.status}">
                                                <option                                                
                                                    value="ABIERTA"/>
                                            </c:if>
                                            Abierta
                                            </option>
                                            <c:if test="${dto.entidad.status == 'ABIERTA'}">
                                                <option                                                
                                                    value="CERRADA"/>
                                            </c:if>
                                            <c:if test="${dto.entidad.status == 'CERRADA' || !dto.entidad.status}">
                                                <option                                                
                                                    value="CERRADA" selected/>
                                            </c:if>
                                            Cerrada
                                            </option>
                                        </select>
                                    </div>
                                    <!-- <div class="col-lg-6">
                                        <div class="mb-2">
                                            <label class="form-label mini">
                                                Fecha
                                            </label>
                                            <input 
                                                type="date" 
                                                class="form-control" 
                                                id="momio" 
                                                name="momio"
                                                placeholder=""
                                                required
                                                value="<c:out value="${dto.entidad.fecha}" />"
                                                >
                                        </div>
                                    </div> -->
                                </div>

                                <c:if test="${dto.entidad.idApuesta != null}">
                                    <div class="mb-2">
                                        <label class="form-label mini">
                                            Ganador de la apuesta
                                        </label>
                                        <select
                                            class="form-select"
                                            id="status"
                                            name="ganador"
                                            placeholder="Selecciona Status..."                                        
                                            aria-label="Default select example"
                                            value="<c:out value="${dto.entidad.status}" />"
                                            >                                            
                                            <c:if test="${dto.entidad.ganador != dto.entidad.equipo1}">
                                                <option                                                
                                                    value="${dto.entidad.equipo1}"/>
                                            </c:if>
                                            <c:if test="${dto.entidad.ganador == dto.entidad.equipo1}">
                                                <option                                                
                                                    value="${dto.entidad.equipo1}" selected/>
                                            </c:if>
                                            <c:out value="${dto.entidad.equipo1}" />
                                            </option>
                                            <c:if test="${dto.entidad.ganador != dto.entidad.equipo2}">
                                                <option                                                
                                                    value="${dto.entidad.equipo2}"/>
                                            </c:if>
                                            <c:if test="${dto.entidad.ganador == dto.entidad.equipo2}">
                                                <option                                                
                                                    value="${dto.entidad.equipo2}" selected/>
                                            </c:if>
                                            <c:out value="${dto.entidad.equipo2}" />
                                            </option>
                                        </select>
                                    </div>
                                </c:if>



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
                                            <c:if test="${dto.entidad.idApuesta != null}">
                                                Actualizar Apuesta
                                            </c:if>
                                            <c:if test="${dto.entidad.idApuesta == null}">
                                                Agregar Apuesta
                                            </c:if>
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
